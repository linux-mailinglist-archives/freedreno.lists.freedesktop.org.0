Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB198ADF8AF
	for <lists+freedreno@lfdr.de>; Wed, 18 Jun 2025 23:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FF510E95A;
	Wed, 18 Jun 2025 21:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GB40cQNO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D43E10E95A
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 21:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750281820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
 b=GB40cQNOblbY2o3qcszXeN/510fUoUs7/awKM7JOhpGLcz4bG83bMb9sC3ywiYw9fhQBXB
 vRe00QFeXVxRkBMjMqU+2bfd2awcOlDqhkSd+XjFxkmGwXU9/Q4SGq2JF5ZVvdDrALSpFe
 raGNZ1sB6qHDvZVDzkrUajYPJyjZJaA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-pM5agawyOy-IYxVLxHo7KQ-1; Wed, 18 Jun 2025 17:23:39 -0400
X-MC-Unique: pM5agawyOy-IYxVLxHo7KQ-1
X-Mimecast-MFC-AGG-ID: pM5agawyOy-IYxVLxHo7KQ_1750281818
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4ff581df3so28816f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 14:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750281818; x=1750886618;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lD3zh9LSKFVLiBeGdrP5eT4T6VTWKD7Got03vgBF8Pk=;
 b=sPx5H3WD6ZJ9e83M1rsKz/zq+JaDoyUSBOUuorj4wt++PqQ/5RLhUqg+2/VOJcuqXK
 Dbt3f8nOa9U9veEwjG/3aHSusLrnRxxV8JNeL/g/IHlMKBS9hzSnheU3wdaHClmgwyF3
 FnB6YCYw4kEo3nwlzjZaJjZ3lHrGsVq6Qnz9fSWOO4WQ+IK7+UhIQ7jRuZ/gWS5gsmyG
 De1npUHi62QXsS2OqXSeE2Trk4I2SwkjDdm9reCUbiTVfhkc6Us6uOq/sZyDbSJS4Eq1
 wfQ/TZbAIIK78XqUpEdZOIR2J4aHYyRE4o60AdVyw73FsyNzNAByAuh+AzHQwTzDeBnk
 eu4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUClTrwBKBWZ5yX7vUykeZqkKxeqzOz2K9c9YOFzkNqXzbhkk4uZVAZVXNuuU9hXezjN5HozZum79A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydeytH7MhE7S9bWNgBfJ9VzcpOUy++t/Cw7i/s51ILvTAtz56x
 Fh185c0Dr1agF4oz7/PcpXc0EN9acTqVgb7E4o1DZwQSOtDU25wu81aZo1e42ISeFlJ373+npU1
 ijRAsvXSPaPZyPIDJtALmnVIUz5PuWdfHdwoqPikJHqZmYIntQveCS7YEjM+rLWQqiORzYg==
X-Gm-Gg: ASbGncttO3iNLN0wPL0wf5P+nBvFQPGtItOUvkcD/cdULPVFCBRfFJcaPXZSnyI59Fv
 HodeOj2trzgbQvhTzhvjVkZNBd2k1hv/v88vwmYMjRMN87vH8zHMCFHNO5EbZDPjXNW1f2MgEna
 BWn8Jg9enRARv6XZHaT/5QNVFp1NQLUygmFAyGCHAQI5qRQpKgwjM/1sHImYbsa1yTKfBtz85Rh
 MQoJ0ZAL1ydEYEX8rfyYex2Ry8ESIGIPHKK9UTuUdJl1wD+Xd1iW3blUBY0F67FQIu0easUORT3
 FJXfeWnTA6w=
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id
 ffacd0b85a97d-3a6c962b2d8mr700662f8f.0.1750281818005; 
 Wed, 18 Jun 2025 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu4QU3bk7dkTV8y21m8O4yJStIuE5s16gVEUTckk6g/n5f2Lm6JEA/tzq7cPIYOVYMNwo42A==
X-Received: by 2002:a05:6000:2a04:b0:3a5:5130:1c71 with SMTP id
 ffacd0b85a97d-3a6c962b2d8mr700648f8f.0.1750281817462; 
 Wed, 18 Jun 2025 14:23:37 -0700 (PDT)
Received: from pollux ([2a00:79c0:6b9:ae00:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5780c5004sm14370775f8f.56.2025.06.18.14.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 14:23:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:23:35 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/gpuvm: Add locking helpers
Message-ID: <aFMuV7PNfSZVWb-b@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
 <aFE6pq8l33NXfFdT@pollux>
 <CACSVV00VzOfTDh2sKst+POzkZ-5MH+0BDY-GVB2WKTyONRrHjw@mail.gmail.com>
 <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACSVV00cng4PzHzqydGw_L34_f+6KiZTyCRdggNfHaDePGzFOA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jyNq2vTEn0SyO3PQcbAQ5J0zL11cFnn4VkLf7_2eOdQ_1750281818
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jun 17, 2025 at 06:43:21AM -0700, Rob Clark wrote:
> On Tue, Jun 17, 2025 at 5:48 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Tue, Jun 17, 2025 at 2:51 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > >
> > > On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> > > > On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > >
> > > > > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > > > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > > > > >
> > > > > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > > > > drm_gpuva_ops to lock those objects.
> > > > > > >
> > > > > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > > > > >
> > > > > > > Please note that for exactly this case there is the op_alloc callback in
> > > > > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > > > > >
> > > > > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > > > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > > > > apply the VM updates immediately to avoid issues with a later
> > > > > > map/unmap overlapping an earlier map, which
> > > > > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > > > > sure why this isn't a problem for other drivers unless userspace is
> > > > > > providing some guarantees.
> > > > >
> > > > > The drm_gpuva_ops are usually used in a pattern like this.
> > > > >
> > > > >         vm_bind {
> > > > >                 for_each_vm_bind_operation {
> > >                             drm_gpuvm_sm_xyz_ops_create();
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify drm_gpuvm's interval tree
> > > > >                                 // pre-allocate memory
> > > > >                                 // lock and prepare objects
> > > > >                         }
> > > > >                 }
> > > > >
> > > > >                 drm_sched_entity_push_job();
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // modify page tables
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > >         run_job {
> > > > >                 for_each_vm_bind_operation {
> > > > >                         drm_gpuva_for_each_op {
> > > > >                                 // free page table structures, if any
> > > > >                                 // free unused pre-allocated memory
> > > > >                         }
> > > > >                 }
> > > > >         }
> > > > >
> > > > > What did you do instead to get map/unmap overlapping? Even more interesting,
> > > > > what are you doing now?
> > > >
> > > > From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> > > > doing drm_gpuva_remove() while iterating the ops list..
> > > > drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> > > > can only really work if you perform one MAP or UNMAP at a time.  Or at
> > > > least if you process the VM modifying part of the ops list before
> > > > proceeding to the next op.
> > >
> > > (Added the drm_gpuvm_sm_xyz_ops_create() step above.)
> > >
> > > I went through the code you posted [1] and conceptually you're implementing
> > > exactly the pattern I described above, i.e. you do:
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_exec_lock();
> > >                 }
> > >
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz() {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // create custom ops
> > >                         }
> > >                 }
> > >
> > >                 drm_sched_entity_push_job();
> > >         }
> > >
> > >         run_job {
> > >                 for_each_vm_bind_operation {
> > >                         for_each_custom_op() {
> > >                                 // do stuff
> > >                         }
> > >                 }
> > >         }
> >
> > Close, but by the time we get to run_job there is just a single list
> > of ops covering all the vm_bind operations:
> >
> >         run_job {
> >                 for_each_custom_op() {
> >                         // do stuff
> >                 }
> >         }
> >
> > rather than a list of va ops per vm_bind op.
> >
> > > However, GPUVM intends to solve your use-case with the following, semantically
> > > identical, approach.
> > >
> > >         vm_bind {
> > >                 for_each_vm_bind_operation {
> > >                         drm_gpuvm_sm_xyz_ops_create();
> > >
> > >                         drm_gpuva_for_each_op {
> > >                                 // modify drm_gpuvm's interval tree
> > >                                 // lock and prepare objects (1)
> >
> > I currently decouple lock+pin from VM modification to avoid an error
> > path that leaves the VM partially modified.  Once you add this back
> > in, the va-ops approach isn't simpler, IMHO.
> 
> Oh, actually scratch that.. using va-ops, it is not even possible to
> decouple locking/prepare from VM modifications.  So using
> DRM_EXEC_INTERRUPTIBLE_WAIT, for ex, with va-ops list would be an
> actively bad idea.

Well, you would need to unwind the VM modifications. I think so far this hasn't
been an issue for drivers, since they have to unwind VM modifications for other
reasons anyways.

Do you never need to unwind for other reasons than locking dma_resv and
preparing GEM objects? Are you really sure there's nothing else in the critical
path?

If there really isn't anything, I agree that those helpers have value and we
should add them. So, if we do so, please document in detail the conditions under
which drm_gpuvm_sm_{map,unmap}_exec_lock() can be called for multiple VM_BIND
ops *without* updating GPUVM's interval tree intermediately, including an
example.

