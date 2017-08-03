/* global moment, Snap */
/**
 * Gantt:
 * 	element: querySelector string, required
 * 	tasks: array of tasks, required
 *   task: { id, name, start, end, progress, dependencies, custom_class }
 * 	config: configuration options, optional
 */


function Gantt(element, tasks, config) {

	const self = {};

	function init() {
		set_defaults();

		// expose methods
		self.change_view_mode = change_view_mode;
		self.unselect_all = unselect_all;
		self.view_is = view_is;
		self.get_bar = get_bar;
		self.trigger_event = trigger_event;
		self.refresh = refresh;

		// initialize with default view mode
		change_view_mode(self.config.view_mode);
	}

	function set_defaults() {

		const defaults = {
			header_height: 50,
			column_width: 30,
			step: 24,
			view_modes: [
				'Quarter Day',
				'Half Day',
				'Day',
				'Week',
				'Month'
			],
			bar: {
				height: 20
			},
			arrow: {
				curve: 5
			},
			padding: 18,
			view_mode: 'Day',
			date_format: 'YYYY-MM-DD',
			custom_popup_html: null
		};
		self.config = Object.assign({}, defaults, config);

		reset_variables(tasks);
	}

	function reset_variables(tasks) {

		self.element = element;
		self._tasks = tasks;

		self._bars = [];
		self._arrows = [];
		self.element_groups = {};
	}

	function refresh(updated_tasks) {
		reset_variables(updated_tasks);
		change_view_mode(self.config.view_mode);
	}

	function change_view_mode(mode) {
		set_scale(mode);
		prepare();
		render();
		// fire viewmode_change event
		trigger_event('view_change', [mode]);
	}

	function prepare() {
		prepare_tasks();
		prepare_dependencies();
		prepare_dates();
		prepare_canvas();
	}

	function prepare_tasks() {

		// prepare tasks
		self.tasks = self._tasks.map((task, i) => {

			// momentify
			task._start = moment(task.start, self.config.date_format);
			task._end = moment(task.end, self.config.date_format);

			// cache index
			task._index = i;

			// invalid dates
			if(!task.start && !task.end) {
				task._start = moment().startOf('day');
				task._end = moment().startOf('day').add(2, 'days');
			}
			if(!task.start && task.end) {
				task._start = task._end.clone().add(-2, 'days');
			}
			if(task.start && !task.end) {
				task._end = task._start.clone().add(2, 'days');
			}

			// invalid flag
			if(!task.start || !task.end) {
				task.invalid = true;
			}

			// dependencies
			if(typeof task.dependencies === 'string' || !task.dependencies) {
				let deps = [];
				if(task.dependencies) {
					deps = task.dependencies
						.split(',')
						.map(d => d.trim())
						.filter((d) => d);
				}
				task.dependencies = deps;
			}

			// uids
			if(!task.id) {
				task.id = generate_id(task);
			}

			return task;
		});
	}

	function prepare_dependencies() {

		self.dependency_map = {};
		for(let t of self.tasks) {
			for(let d of t.dependencies) {
				self.dependency_map[d] = self.dependency_map[d] || [];
				self.dependency_map[d].push(t.id);
			}
		}
	}

	function prepare_dates() {

		self.gantt_start = self.gantt_end = null;
		for(let task of self.tasks) {
			// set global start and end date
			if(!self.gantt_start || task._start < self.gantt_start) {
				self.gantt_start = task._start;
			}
			if(!self.gantt_end || task._end > self.gantt_end) {
				self.gantt_end = task._end;
			}
		}
		set_gantt_dates();
		setup_dates();
	}

	function prepare_canvas() {
		if(self.canvas) return;
		self.canvas = Snap(self.element).addClass('gantt');
	}

	function render() {
		clear();
		setup_groups();
		make_grid();
		make_dates();
		make_bars();
		make_arrows();
		map_arrows_on_bars();
		set_width();
		set_scroll_position();
		bind_grid_click();
	}

	function clear() {
		self.canvas.clear();
		self._bars = [];
		self._arrows = [];
	}

	function set_gantt_dates() {

		if(view_is(['Quarter Day', 'Half Day'])) {
			self.gantt_start = self.gantt_start.clone().subtract(7, 'day');
			self.gantt_end = self.gantt_end.clone().add(7, 'day');
		} else if(view_is('Month')) {
			self.gantt_start = self.gantt_start.clone().startOf('year');
			self.gantt_end = self.gantt_end.clone().endOf('month').add(1, 'year');
		} else {
			self.gantt_start = self.gantt_start.clone().startOf('month').subtract(1, 'month');
			self.gantt_end = self.gantt_end.clone().endOf('month').add(1, 'month');
		}
	}

	function setup_dates() {

		self.dates = [];
		let cur_date = null;

		while(cur_date === null || cur_date < self.gantt_end) {
			if(!cur_date) {
				cur_date = self.gantt_start.clone();
			} else {
				cur_date = view_is('Month') ?
					cur_date.clone().add(1, 'month') :
					cur_date.clone().add(self.config.step, 'hours');
			}
			self.dates.push(cur_date);
		}
	}

	function setup_groups() {

		const groups = ['grid', 'date', 'arrow', 'progress', 'bar', 'details'];
		// make group layers
		for(let group of groups) {
			self.element_groups[group] = self.canvas.group().attr({'id': group});
		}
	}

	function set_scale(scale) {
		self.config.view_mode = scale;

		if(scale === 'Day') {
			self.config.step = 24;
			self.config.column_width = 38;
		} else if(scale === 'Half Day') {
			self.config.step = 24 / 2;
			self.config.column_width = 38;
		} else if(scale === 'Quarter Day') {
			self.config.step = 24 / 4;
			self.config.column_width = 38;
		} else if(scale === 'Week') {
			self.config.step = 24 * 7;
			self.config.column_width = 140;
		} else if(scale === 'Month') {
			self.config.step = 24 * 30;
			self.config.column_width = 120;
		}
	}

	function set_width() {
		const cur_width = self.canvas.node.getBoundingClientRect().width;
		const actual_width = self.canvas.select('#grid .grid-row').attr('width');
		if(cur_width < actual_width) {
			self.canvas.attr('width', actual_width);
		}
	}

	function set_scroll_position() {
		const parent_element = document.querySelector(self.element).parentElement;
		if(!parent_element) return;

		const scroll_pos = get_min_date().diff(self.gantt_start, 'hours') /
			self.config.step * self.config.column_width - self.config.column_width;
		parent_element.scrollLeft = scroll_pos;
	}

	function get_min_date() {
		const task = self.tasks.reduce((acc, curr) => {
			return curr._start.isSameOrBefore(acc._start) ? curr : acc;
		});
		return task._start;
	}

	function make_grid() {
		make_grid_background();
		make_grid_rows();
		make_grid_header();
		make_grid_ticks();
		make_grid_highlights();
	}

	function make_grid_background() {

		const grid_width = self.dates.length * self.config.column_width,
			grid_height = self.config.header_height + self.config.padding +
				(self.config.bar.height + self.config.padding) * self.tasks.length;

		self.canvas.rect(0, 0, grid_width, grid_height)
			.addClass('grid-background')
			.appendTo(self.element_groups.grid);

		self.canvas.attr({
			height: grid_height + self.config.padding,
			width: '100%'
		});
	}

	function make_grid_header() {
		const header_width = self.dates.length * self.config.column_width,
			header_height = self.config.header_height + 10;
		self.canvas.rect(0, 0, header_width, header_height)
			.addClass('grid-header')
			.appendTo(self.element_groups.grid);
	}

	function make_grid_rows() {

		const rows = self.canvas.group().appendTo(self.element_groups.grid),
			lines = self.canvas.group().appendTo(self.element_groups.grid),
			row_width = self.dates.length * self.config.column_width,
			row_height = self.config.bar.height + self.config.padding;

		let row_y = self.config.header_height + self.config.padding / 2;

		for(let task of self.tasks) { // eslint-disable-line
			self.canvas.rect(0, row_y, row_width, row_height)
				.addClass('grid-row')
				.appendTo(rows);

			self.canvas.line(0, row_y + row_height, row_width, row_y + row_height)
				.addClass('row-line')
				.appendTo(lines);

			row_y += self.config.bar.height + self.config.padding;
		}
	}

	function make_grid_ticks() {
		let tick_x = 0,
			tick_y = self.config.header_height + self.config.padding / 2,
			tick_height = (self.config.bar.height + self.config.padding) * self.tasks.length;

		for(let date of self.dates) {
			let tick_class = 'tick';
			// thick tick for monday
			if(view_is('Day') && date.day() === 1) {
				tick_class += ' thick';
			}
			// thick tick for first week
			if(view_is('Week') && date.date() >= 1 && date.date() < 8) {
				tick_class += ' thick';
			}
			// thick ticks for quarters
			if(view_is('Month') && date.month() % 3 === 0) {
				tick_class += ' thick';
			}

			self.canvas.path(Snap.format('M {x} {y} v {height}', {
				x: tick_x,
				y: tick_y,
				height: tick_height
			}))
			.addClass(tick_class)
			.appendTo(self.element_groups.grid);

			if(view_is('Month')) {
				tick_x += date.daysInMonth() * self.config.column_width / 30;
			} else {
				tick_x += self.config.column_width;
			}
		}
	}

	function make_grid_highlights() {

		// highlight today's date
		if(view_is('Day')) {
			const x = moment().startOf('day').diff(self.gantt_start, 'hours') /
					self.config.step * self.config.column_width;
			const y = 0;
			const width = self.config.column_width;
			const height = (self.config.bar.height + self.config.padding) * self.tasks.length +
				self.config.header_height + self.config.padding / 2;

			self.canvas.rect(x, y, width, height)
				.addClass('today-highlight')
				.appendTo(self.element_groups.grid);
		}
	}

	function make_dates() {

		for(let date of get_dates_to_draw()) {
			self.canvas.text(date.lower_x, date.lower_y, date.lower_text)
				.addClass('lower-text')
				.appendTo(self.element_groups.date);

			if(date.upper_text) {
				const $upper_text = self.canvas.text(date.upper_x, date.upper_y, date.upper_text)
					.addClass('upper-text')
					.appendTo(self.element_groups.date);

				// remove out-of-bound dates
				if($upper_text.getBBox().x2 > self.element_groups.grid.getBBox().width) {
					$upper_text.remove();
				}
			}
		}
	}

	function get_dates_to_draw() {
		let last_date = null;
		const dates = self.dates.map((date, i) => {
			const d = get_date_info(date, last_date, i);
			last_date = date;
			return d;
		});
		return dates;
	}

	function get_date_info(date, last_date, i) {
		if(!last_date) {
			last_date = date.clone().add(1, 'year');
		}
		const date_text = {
			'Quarter Day_lower': date.format('HH'),
			'Half Day_lower': date.format('HH'),
			'Day_lower': date.date() !== last_date.date() ? date.format('D') : '',
			'Week_lower': date.month() !== last_date.month() ?
				date.format('D MMM') : date.format('D'),
			'Month_lower': date.format('MMMM'),
			'Quarter Day_upper': date.date() !== last_date.date() ? date.format('D MMM') : '',
			'Half Day_upper': date.date() !== last_date.date() ?
				date.month() !== last_date.month() ?
				date.format('D MMM') : date.format('D') : '',
			'Day_upper': date.month() !== last_date.month() ? date.format('MMMM') : '',
			'Week_upper': date.month() !== last_date.month() ? date.format('MMMM') : '',
			'Month_upper': date.year() !== last_date.year() ? date.format('YYYY') : ''
		};

		const base_pos = {
			x: i * self.config.column_width,
			lower_y: self.config.header_height,
			upper_y: self.config.header_height - 25
		};

		const x_pos = {
			'Quarter Day_lower': (self.config.column_width * 4) / 2,
			'Quarter Day_upper': 0,
			'Half Day_lower': (self.config.column_width * 2) / 2,
			'Half Day_upper': 0,
			'Day_lower': self.config.column_width / 2,
			'Day_upper': (self.config.column_width * 30) / 2,
			'Week_lower': 0,
			'Week_upper': (self.config.column_width * 4) / 2,
			'Month_lower': self.config.column_width / 2,
			'Month_upper': (self.config.column_width * 12) / 2
		};

		return {
			upper_text: date_text[`${self.config.view_mode}_upper`],
			lower_text: date_text[`${self.config.view_mode}_lower`],
			upper_x: base_pos.x + x_pos[`${self.config.view_mode}_upper`],
			upper_y: base_pos.upper_y,
			lower_x: base_pos.x + x_pos[`${self.config.view_mode}_lower`],
			lower_y: base_pos.lower_y
		};
	}

	function make_arrows() {
		self._arrows = [];
		for(let task of self.tasks) {
			let arrows = [];
			arrows = task.dependencies.map(dep => {
				const dependency = get_task(dep);
				if(!dependency) return;

				const arrow = Arrow(
					self, // gt
					self._bars[dependency._index], // from_task
					self._bars[task._index] // to_task
				);
				self.element_groups.arrow.add(arrow.element);
				return arrow; // eslint-disable-line
			}).filter(arr => arr); // filter falsy values
			self._arrows = self._arrows.concat(arrows);
		}
	}

	function make_bars() {

		self._bars = self.tasks.map((task) => {
			const bar = Bar(self, task);
			self.element_groups.bar.add(bar.group);
			return bar;
		});
	}

	function map_arrows_on_bars() {
		for(let bar of self._bars) {
			bar.arrows = self._arrows.filter(arrow => {
				return (arrow.from_task.task.id === bar.task.id) ||
					(arrow.to_task.task.id === bar.task.id);
			});
		}
	}

	function bind_grid_click() {
		self.element_groups.grid.click(() => {
			unselect_all();
			self.element_groups.details
				.selectAll('.details-wrapper')
				.forEach(el => el.addClass('hide'));
		});
	}

	function unselect_all() {
		self.canvas.selectAll('.bar-wrapper').forEach(el => {
			el.removeClass('active');
		});
	}

	function view_is(modes) {
		if (typeof modes === 'string') {
			return self.config.view_mode === modes;
		} else if(Array.isArray(modes)) {
			for (let mode of modes) {
				if(self.config.view_mode === mode) return true;
			}
			return false;
		}
	}

	function get_task(id) {
		return self.tasks.find((task) => {
			return task.id === id;
		});
	}

	function get_bar(id) {
		return self._bars.find((bar) => {
			return bar.task.id === id;
		});
	}

	function generate_id(task) {
		return task.name + '_' + Math.random().toString(36).slice(2, 12);
	}

	function trigger_event(event, args) {
		if(self.config['on_' + event]) {
			self.config['on_' + event].apply(null, args);
		}
	}

	init();

	return self;
}



function Bar(gt, task) {

	const self = {};

	function init() {
		set_defaults();
		prepare();
		draw();
		bind();
	}

	function set_defaults() {
		self.action_completed = false;
		self.task = task;
	}

	function prepare() {
		prepare_values();
		prepare_plugins();
	}

	function prepare_values() {
		self.invalid = self.task.invalid;
		self.height = gt.config.bar.height;
		self.x = compute_x();
		self.y = compute_y();
		self.corner_radius = 3;
		self.duration = (self.task._end.diff(self.task._start, 'hours') + 24) / gt.config.step;
		self.width = gt.config.column_width * self.duration;
		self.progress_width = gt.config.column_width * self.duration * (self.task.progress / 100) || 0;
		self.group = gt.canvas.group().addClass('bar-wrapper').addClass(self.task.custom_class || '');
		self.bar_group = gt.canvas.group().addClass('bar-group').appendTo(self.group);
		self.handle_group = gt.canvas.group().addClass('handle-group').appendTo(self.group);
	}

	function prepare_plugins() {
		Snap.plugin(function (Snap, Element, Paper, global, Fragment) {
			Element.prototype.getX = function () {
				return +this.attr('x');
			};
			Element.prototype.getY = function () {
				return +this.attr('y');
			};
			Element.prototype.getWidth = function () {
				return +this.attr('width');
			};
			Element.prototype.getHeight = function () {
				return +this.attr('height');
			};
			Element.prototype.getEndX = function () {
				return this.getX() + this.getWidth();
			};
		});
	}

	function draw() {
		draw_bar();
		draw_progress_bar();
		draw_label();
		draw_resize_handles();
	}

	function draw_bar() {
		self.$bar = gt.canvas.rect(self.x, self.y,
			self.width, self.height,
			self.corner_radius, self.corner_radius)
			.addClass('bar')
			.appendTo(self.bar_group);
		if (self.invalid) {
			self.$bar.addClass('bar-invalid');
		}
	}

	function draw_progress_bar() {
		if (self.invalid) return;
		self.$bar_progress = gt.canvas.rect(self.x, self.y,
			self.progress_width, self.height,
			self.corner_radius, self.corner_radius)
			.addClass('bar-progress')
			.appendTo(self.bar_group);
	}

	function draw_label() {
		gt.canvas.text(self.x + self.width / 2,
			self.y + self.height / 2,
			self.task.name)
			.addClass('bar-label')
			.appendTo(self.bar_group);
		update_label_position();
	}

	function draw_resize_handles() {
		if (self.invalid) return;

		const bar = self.$bar,
			handle_width = 8;

		gt.canvas.rect(bar.getX() + bar.getWidth() - 9, bar.getY() + 1,
			handle_width, self.height - 2, self.corner_radius, self.corner_radius)
			.addClass('handle right')
			.appendTo(self.handle_group);
		gt.canvas.rect(bar.getX() + 1, bar.getY() + 1,
			handle_width, self.height - 2, self.corner_radius, self.corner_radius)
			.addClass('handle left')
			.appendTo(self.handle_group);

		if (self.task.progress && self.task.progress < 100) {
			gt.canvas.polygon(get_progress_polygon_points())
				.addClass('handle progress')
				.appendTo(self.handle_group);
		}
	}

	function get_progress_polygon_points() {
		const bar_progress = self.$bar_progress;
		return [
			bar_progress.getEndX() - 5, bar_progress.getY() + bar_progress.getHeight(),
			bar_progress.getEndX() + 5, bar_progress.getY() + bar_progress.getHeight(),
			bar_progress.getEndX(), bar_progress.getY() + bar_progress.getHeight() - 8.66
		];
	}

	function bind() {
		if (self.invalid) return;
		setup_click_event();
		show_details();
		bind_resize();
		bind_drag();
		bind_resize_progress();
	}

	function show_details() {
		const popover_group = gt.element_groups.details;
		self.details_box = popover_group
			.select(`.details-wrapper[data-task='${self.task.id}']`);

		if (!self.details_box) {
			self.details_box = gt.canvas.group()
				.addClass('details-wrapper hide')
				.attr('data-task', self.task.id)
				.appendTo(popover_group);

			render_details();

			const f = gt.canvas.filter(
				Snap.filter.shadow(0, 1, 1, '#666', 0.6));
			self.details_box.attr({
				filter: f
			});
		}

		self.group.click((e) => {
			if (self.action_completed) {
				// just finished a move action, wait for a few seconds
				return;
			}
			popover_group.selectAll('.details-wrapper')
				.forEach(el => el.addClass('hide'));
			self.details_box.removeClass('hide');
		});
	}

	function render_details() {
		const {x, y} = get_details_position();
		self.details_box.transform(`t${x},${y}`);
		self.details_box.clear();

		const html = get_details_html();
		const foreign_object =
			Snap.parse(`<foreignObject width="5000" height="2000">
				<body xmlns="http://www.w3.org/1999/xhtml">
					${html}
				</body>
				</foreignObject>`);
		self.details_box.append(foreign_object);
	}

	function get_details_html() {

		// custom html in config
		if(gt.config.custom_popup_html) {
			const html = gt.config.custom_popup_html;
			if(typeof html === 'string') {
				return html;
			}
			if(isFunction(html)) {
				return html(task);
			}
		}

		const start_date = self.task._start.format('MMM D');
		const end_date = self.task._end.format('MMM D');
		const heading = `${self.task.name}: ${start_date} - ${end_date}`;

		const line_1 = `Duration: ${self.duration} days`;
		const line_2 = self.task.progress ? `Progress: ${self.task.progress}` : null;

		const html = `
			<div class="details-container">
				<h5>${heading}</h5>
				<p>${line_1}</p>
				${
					line_2 ? `<p>${line_2}</p>` : ''
				}
			</div>
		`;
		return html;
	}

	function get_details_position() {
		return {
			x: self.$bar.getEndX() + 2,
			y: self.$bar.getY() - 10
		};
	}

	function bind_resize() {
		const { left, right } = get_handles();

		left.drag(onmove_left, onstart, onstop_left);
		right.drag(onmove_right, onstart, onstop_right);

		function onmove_right(dx, dy) {
			onmove_handle_right(dx, dy);
		}
		function onstop_right() {
			onstop_handle_right();
		}

		function onmove_left(dx, dy) {
			onmove_handle_left(dx, dy);
		}
		function onstop_left() {
			onstop_handle_left();
		}
	}

	function get_handles() {
		return {
			left: self.handle_group.select('.handle.left'),
			right: self.handle_group.select('.handle.right')
		};
	}

	function bind_drag() {
		self.bar_group.drag(onmove, onstart, onstop);
	}

	function bind_resize_progress() {
		const bar = self.$bar,
			bar_progress = self.$bar_progress,
			handle = self.group.select('.handle.progress');
		handle && handle.drag(on_move, on_start, on_stop);

		function on_move(dx, dy) {
			if (dx > bar_progress.max_dx) {
				dx = bar_progress.max_dx;
			}
			if (dx < bar_progress.min_dx) {
				dx = bar_progress.min_dx;
			}

			bar_progress.attr('width', bar_progress.owidth + dx);
			handle.attr('points', get_progress_polygon_points());
			bar_progress.finaldx = dx;
		}
		function on_stop() {
			if (!bar_progress.finaldx) return;
			progress_changed();
			set_action_completed();
		}
		function on_start() {
			bar_progress.finaldx = 0;
			bar_progress.owidth = bar_progress.getWidth();
			bar_progress.min_dx = -bar_progress.getWidth();
			bar_progress.max_dx = bar.getWidth() - bar_progress.getWidth();
		}
	}

	function onstart() {
		const bar = self.$bar;
		bar.ox = bar.getX();
		bar.oy = bar.getY();
		bar.owidth = bar.getWidth();
		bar.finaldx = 0;
		run_method_for_dependencies('onstart');
	}
	self.onstart = onstart;

	function onmove(dx, dy) {
		const bar = self.$bar;
		bar.finaldx = get_snap_position(dx);
		update_bar_position({x: bar.ox + bar.finaldx});
		run_method_for_dependencies('onmove', [dx, dy]);
	}
	self.onmove = onmove;

	function onstop() {
		const bar = self.$bar;
		if (!bar.finaldx) return;
		date_changed();
		set_action_completed();
		run_method_for_dependencies('onstop');
	}
	self.onstop = onstop;

	function onmove_handle_left(dx, dy) {
		const bar = self.$bar;
		bar.finaldx = get_snap_position(dx);
		update_bar_position({
			x: bar.ox + bar.finaldx,
			width: bar.owidth - bar.finaldx
		});
		run_method_for_dependencies('onmove', [dx, dy]);
	}
	self.onmove_handle_left = onmove_handle_left;

	function onstop_handle_left() {
		const bar = self.$bar;
		if (bar.finaldx) date_changed();
		set_action_completed();
		run_method_for_dependencies('onstop');
	}
	self.onstop_handle_left = onstop_handle_left;

	function run_method_for_dependencies(fn, args) {
		const dm = gt.dependency_map;
		if (dm[self.task.id]) {
			for (let deptask of dm[self.task.id]) {
				const dt = gt.get_bar(deptask);
				dt[fn].apply(dt, args);
			}
		}
	}

	function onmove_handle_right(dx, dy) {
		const bar = self.$bar;
		bar.finaldx = get_snap_position(dx);
		update_bar_position({width: bar.owidth + bar.finaldx});
	}

	function onstop_handle_right() {
		const bar = self.$bar;
		if (bar.finaldx) date_changed();
		set_action_completed();
	}

	function update_bar_position({x = null, width = null}) {
		const bar = self.$bar;
		if (x) {
			// get all x values of parent task
			const xs = task.dependencies.map(dep => {
				return gt.get_bar(dep).$bar.getX();
			});
			// child task must not go before parent
			const valid_x = xs.reduce((prev, curr) => {
				return x >= curr;
			}, x);
			if(!valid_x) {
				width = null;
				return;
			}
			update_attr(bar, 'x', x);
		}
		if (width && width >= gt.config.column_width) {
			update_attr(bar, 'width', width);
		}
		update_label_position();
		update_handle_position();
		update_progressbar_position();
		update_arrow_position();
		update_details_position();
	}

	function setup_click_event() {
		self.group.click(function () {
			if (self.action_completed) {
				// just finished a move action, wait for a few seconds
				return;
			}
			if (self.group.hasClass('active')) {
				gt.trigger_event('click', [self.task]);
			}
			gt.unselect_all();
			self.group.toggleClass('active');
		});
	}

	function date_changed() {
		const { new_start_date, new_end_date } = compute_start_end_date();
		self.task._start = new_start_date;
		self.task._end = new_end_date;
		render_details();
		gt.trigger_event('date_change',
			[self.task, new_start_date, new_end_date]);
	}

	function progress_changed() {
		const new_progress = compute_progress();
		self.task.progress = new_progress;
		render_details();
		gt.trigger_event('progress_change',
			[self.task, new_progress]);
	}

	function set_action_completed() {
		self.action_completed = true;
		setTimeout(() => self.action_completed = false, 2000);
	}

	function compute_start_end_date() {
		const bar = self.$bar;
		const x_in_units = bar.getX() / gt.config.column_width;
		const new_start_date = gt.gantt_start.clone().add(x_in_units * gt.config.step, 'hours');
		const width_in_units = bar.getWidth() / gt.config.column_width;
		const new_end_date = new_start_date.clone().add(width_in_units * gt.config.step, 'hours');
		// lets say duration is 2 days
		// start_date = May 24 00:00:00
		// end_date = May 24 + 2 days = May 26 (incorrect)
		// so subtract 1 second so that
		// end_date = May 25 23:59:59
		new_end_date.add('-1', 'seconds');
		return { new_start_date, new_end_date };
	}

	function compute_progress() {
		const progress = self.$bar_progress.getWidth() / self.$bar.getWidth() * 100;
		return parseInt(progress, 10);
	}

	function compute_x() {
		let x = self.task._start.diff(gt.gantt_start, 'hours') /
			gt.config.step * gt.config.column_width;

		if (gt.view_is('Month')) {
			x = self.task._start.diff(gt.gantt_start, 'days') *
				gt.config.column_width / 30;
		}
		return x;
	}

	function compute_y() {
		return gt.config.header_height + gt.config.padding +
			self.task._index * (self.height + gt.config.padding);
	}

	function get_snap_position(dx) {
		let odx = dx, rem, position;

		if (gt.view_is('Week')) {
			rem = dx % (gt.config.column_width / 7);
			position = odx - rem +
				((rem < gt.config.column_width / 14) ? 0 : gt.config.column_width / 7);
		} else if (gt.view_is('Month')) {
			rem = dx % (gt.config.column_width / 30);
			position = odx - rem +
				((rem < gt.config.column_width / 60) ? 0 : gt.config.column_width / 30);
		} else {
			rem = dx % gt.config.column_width;
			position = odx - rem +
				((rem < gt.config.column_width / 2) ? 0 : gt.config.column_width);
		}
		return position;
	}

	function update_attr(element, attr, value) {
		value = +value;
		if (!isNaN(value)) {
			element.attr(attr, value);
		}
		return element;
	}

	function update_progressbar_position() {
		self.$bar_progress.attr('x', self.$bar.getX());
		self.$bar_progress.attr('width', self.$bar.getWidth() * (self.task.progress / 100));
	}

	function update_label_position() {
		const bar = self.$bar,
			label = self.group.select('.bar-label');
		if (label.getBBox().width > bar.getWidth()) {
			label.addClass('big').attr('x', bar.getX() + bar.getWidth() + 5);
		} else {
			label.removeClass('big').attr('x', bar.getX() + bar.getWidth() / 2);
		}
	}

	function update_handle_position() {
		const bar = self.$bar;
		self.handle_group.select('.handle.left').attr({
			'x': bar.getX() + 1
		});
		self.handle_group.select('.handle.right').attr({
			'x': bar.getEndX() - 9
		});
		const handle = self.group.select('.handle.progress');
		handle && handle.attr('points', get_progress_polygon_points());
	}

	function update_arrow_position() {
		for (let arrow of self.arrows) {
			arrow.update();
		}
	}

	function update_details_position() {
		const {x, y} = get_details_position();
		self.details_box && self.details_box.transform(`t${x},${y}`);
	}

	function isFunction(functionToCheck) {
		var getType = {};
		return functionToCheck && getType.toString.call(functionToCheck) === '[object Function]';
	}

	init();

	return self;
}





function Arrow(gt, from_task, to_task) {

	const self = {};

	function init() {
		self.from_task = from_task;
		self.to_task = to_task;
		prepare();
		draw();
	}

	function prepare() {

		self.start_x = from_task.$bar.getX() + from_task.$bar.getWidth() / 2;

		const condition = () =>
			to_task.$bar.getX() < self.start_x + gt.config.padding &&
				self.start_x > from_task.$bar.getX() + gt.config.padding;

		while(condition()) {
			self.start_x -= 10;
		}

		self.start_y = gt.config.header_height + gt.config.bar.height +
			(gt.config.padding + gt.config.bar.height) * from_task.task._index +
			gt.config.padding;

		self.end_x = to_task.$bar.getX() - gt.config.padding / 2;
		self.end_y = gt.config.header_height + gt.config.bar.height / 2 +
			(gt.config.padding + gt.config.bar.height) * to_task.task._index +
			gt.config.padding;

		const from_is_below_to = (from_task.task._index > to_task.task._index);
		self.curve = gt.config.arrow.curve;
		self.clockwise = from_is_below_to ? 1 : 0;
		self.curve_y = from_is_below_to ? -self.curve : self.curve;
		self.offset = from_is_below_to ?
			self.end_y + gt.config.arrow.curve :
			self.end_y - gt.config.arrow.curve;

		self.path =
			Snap.format('M {start_x} {start_y} V {offset} ' +
				'a {curve} {curve} 0 0 {clockwise} {curve} {curve_y} ' +
				'L {end_x} {end_y} m -5 -5 l 5 5 l -5 5',
				{
					start_x: self.start_x,
					start_y: self.start_y,
					end_x: self.end_x,
					end_y: self.end_y,
					offset: self.offset,
					curve: self.curve,
					clockwise: self.clockwise,
					curve_y: self.curve_y
				});

		if(to_task.$bar.getX() < from_task.$bar.getX() + gt.config.padding) {
			self.path =
				Snap.format('M {start_x} {start_y} v {down_1} ' +
				'a {curve} {curve} 0 0 1 -{curve} {curve} H {left} ' +
				'a {curve} {curve} 0 0 {clockwise} -{curve} {curve_y} V {down_2} ' +
				'a {curve} {curve} 0 0 {clockwise} {curve} {curve_y} ' +
				'L {end_x} {end_y} m -5 -5 l 5 5 l -5 5',
					{
						start_x: self.start_x,
						start_y: self.start_y,
						end_x: self.end_x,
						end_y: self.end_y,
						down_1: gt.config.padding / 2 - self.curve,
						down_2: to_task.$bar.getY() + to_task.$bar.getHeight() / 2 - self.curve_y,
						left: to_task.$bar.getX() - gt.config.padding,
						offset: self.offset,
						curve: self.curve,
						clockwise: self.clockwise,
						curve_y: self.curve_y
					});
		}
	}

	function draw() {
		self.element = gt.canvas.path(self.path)
			.attr('data-from', self.from_task.task.id)
			.attr('data-to', self.to_task.task.id);
	}

	function update() { // eslint-disable-line
		prepare();
		self.element.attr('d', self.path);
	}
	self.update = update;

	init();

	return self;
}
