Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08155ADC712
	for <lists+freedreno@lfdr.de>; Tue, 17 Jun 2025 11:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DDE10E5BA;
	Tue, 17 Jun 2025 09:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fi+E+HZy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CF010E5BB
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750153900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
 b=Fi+E+HZyG2DSpJyknBLdGzyRwsTrsD1u4Oajq+GpYyCK1j3Kf/PUhuphPdRhGtq4RUkIEP
 tmWLZjSzC+9gnxRFVhOEZmKM1+nI6zVOGQzQHHpVTcjIl2vbdWu5aaR+8I0ghEcQDagT8o
 KBQowGyF5LNtPfGVqivVX5nnMW2ftJc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-M7xQj8oNNc6akWWKwmrfzg-1; Tue, 17 Jun 2025 05:51:38 -0400
X-MC-Unique: M7xQj8oNNc6akWWKwmrfzg-1
X-Mimecast-MFC-AGG-ID: M7xQj8oNNc6akWWKwmrfzg_1750153897
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4530ec2c87cso28206825e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jun 2025 02:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750153897; x=1750758697;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1J9EKk4I7H6WmvI/18gnTD4j7ClTvJrTACRAA21oo8=;
 b=g/4G2GYmmdmsL6RJdEKgy7FaSvwwmHDVOPS3trgRrLekYdFVyyogqUyV8CyU4jyPph
 hA6cWtgtjYJOpaoRyy3uShilJUpCqeXVV6Tfsq/EzD59cu6pwNOfbjkOpL8NzD946NYC
 vr5M6Z0/xVgcvPcj1WwhNbBy1En45Gyj31viwDhxpiyKjtkmGCKkVrcXDCfYI+YkQbTm
 4nypQaEGlr2e/xivS0B6PmAjeBc8nUBllUeatxwwz+QU+0Exc9MapvuzwtpEnPcgMYOS
 1+v81qcwxgEpvO5Qq7k6Q4ZW2twqS+s3w/SwVLDJ2ksMjJyXhZx2qOzr7pPlGa/79BIC
 p3Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVrrC0uYdR9dLpQ9IiA7WPkv2IoxMrsHZFf9NVHpjzvr+bWphdqqVmns5FCmJyR0h6x45oBP66jPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2YUaz587fjgAs8LseKJJed9w0rlC507KT7m4UcEthI2kA8vXs
 6YPsKPH4KasY1NLnc98zE2eV4Va87r7DtZXnJ0ZIG1FdoykRPr7g0ZYXwXqCxnqSfoK412dLooo
 lJZ79EVfiWT2X8or29+ImYWivm1N7+CU+bmenrPWEq5IwJgi3NrDm0Qki8iMMeJllNLxZJw==
X-Gm-Gg: ASbGncuR7K/FXVBC3p7yDS/2HBi4k6M3ZFWpMIZYkzZtHMqzHF6mxNqZWQFhTsfXXCC
 tYBsRWEY28/m2yyJnUPMVuepen3JHA9Jdi1TMSoxF1hfKrjZYXyorKrOGA8RZdshPWFpZZ4tA+5
 T0Icu0qxl+kASv6aWM4m7LmUqiNOuJjRf0ZPmOsHAamNJHKSvx+0XZvO6EwCon+GuurjNFbZml4
 7fxyJ2eTP8SR+0wg0MJCVLo+cU7Xoos3Jex5Xv6mAP7y0aVpCrUUpCmU5J71fYNhV6HYtd0etKR
 FWmRHiUh7HY=
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-4533cac9179mr105803375e9.23.1750153897089; 
 Tue, 17 Jun 2025 02:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFldMEnuo9yC084iP1KvhWhShNC4LmtmIc7iidP4b8onqmO+ZGv8akFrhh6Cvt1pfxb1j8zTw==
X-Received: by 2002:a05:600c:8b01:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-4533cac9179mr105803085e9.23.1750153896629; 
 Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Received: from pollux ([2a00:79c0:62e:9200:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e224600sm171952695e9.8.2025.06.17.02.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 02:51:36 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:51:34 +0200
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
Message-ID: <aFE6pq8l33NXfFdT@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
 <aFCO7_RHuAaGyq1Q@pollux>
 <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACSVV03WboQp_A1bzQ+xpX5DDkfaoXmbTuo9RfZ9bMaVTqdU+A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0jMj8Y70Yrarah8rkkeDApj2VNhDZIeEj54or_GdgVE_1750153897
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

On Mon, Jun 16, 2025 at 03:25:08PM -0700, Rob Clark wrote:
> On Mon, Jun 16, 2025 at 2:39 PM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> > > On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> > > >
> > > > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > > > VAs.  These helpers handle locking/preparing the needed objects.
> > > >
> > > > Yes, that's a common use-case. I think drivers typically iterate through their
> > > > drm_gpuva_ops to lock those objects.
> > > >
> > > > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > > > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> > > >
> > > > Please note that for exactly this case there is the op_alloc callback in
> > > > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > > > msm_vm_op) that embedds a struct drm_gpuva_op.
> > >
> > > I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> > > VM_BIND series, but it wasn't quite what I was after.  I wanted to
> > > apply the VM updates immediately to avoid issues with a later
> > > map/unmap overlapping an earlier map, which
> > > drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> > > sure why this isn't a problem for other drivers unless userspace is
> > > providing some guarantees.
> >
> > The drm_gpuva_ops are usually used in a pattern like this.
> >
> >         vm_bind {
> >                 for_each_vm_bind_operation {
			    drm_gpuvm_sm_xyz_ops_create();
> >                         drm_gpuva_for_each_op {
> >                                 // modify drm_gpuvm's interval tree
> >                                 // pre-allocate memory
> >                                 // lock and prepare objects
> >                         }
> >                 }
> >
> >                 drm_sched_entity_push_job();
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // modify page tables
> >                         }
> >                 }
> >         }
> >
> >         run_job {
> >                 for_each_vm_bind_operation {
> >                         drm_gpuva_for_each_op {
> >                                 // free page table structures, if any
> >                                 // free unused pre-allocated memory
> >                         }
> >                 }
> >         }
> >
> > What did you do instead to get map/unmap overlapping? Even more interesting,
> > what are you doing now?
> 
> From what I can tell, the drivers using drm_gpva_for_each_op()/etc are
> doing drm_gpuva_remove() while iterating the ops list..
> drm_gpuvm_sm_xyz_ops_create() itself does not modify the VM.  So this
> can only really work if you perform one MAP or UNMAP at a time.  Or at
> least if you process the VM modifying part of the ops list before
> proceeding to the next op.

(Added the drm_gpuvm_sm_xyz_ops_create() step above.)

I went through the code you posted [1] and conceptually you're implementing
exactly the pattern I described above, i.e. you do:

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_exec_lock();
		}

		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz() {
				// modify drm_gpuvm's interval tree
				// create custom ops
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			for_each_custom_op() {
				// do stuff
			}
		}
	}

However, GPUVM intends to solve your use-case with the following, semantically
identical, approach.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuvm_sm_xyz_ops_create();

			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// lock and prepare objects (1)
			}
		}

		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op() {
				// do stuff
			}
		}
	}

(Note that GPUVM already supports to extend the existing OP structures; you
should take advantage of that.)

Hence, the helper we really want is to lock and prepare the objects at (1). I.e.
a helper that takes a pointer to a struct drm_gpuva_op and locks / validates the
corresponding objects.

[1] https://gitlab.freedesktop.org/robclark/msm/-/blob/sparse-newer/drivers/gpu/drm/msm/msm_gem_vma.c

