Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4ECADBBFA
	for <lists+freedreno@lfdr.de>; Mon, 16 Jun 2025 23:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8686D10E080;
	Mon, 16 Jun 2025 21:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dHXfUnvd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D36F10E080
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 21:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750109943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
 b=dHXfUnvdiBHUeO0OGGf9rf2Tod53w2vwOJnrP1B3Vp8dWMEWSCBgsTWpFRKjPRoxG6V21W
 vWCPZaAF/oMid9ns5hT48xLMtArIkv2DbENc6fsV8NpFtyIvcB+yNeyZON6N6L6Mn3qPtJ
 Rxr0UhVdnENEGnMimuujfcSP8ed32yY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-QhzJxuJ3OLu0m9MVEFIedg-1; Mon, 16 Jun 2025 17:39:00 -0400
X-MC-Unique: QhzJxuJ3OLu0m9MVEFIedg-1
X-Mimecast-MFC-AGG-ID: QhzJxuJ3OLu0m9MVEFIedg_1750109939
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a37a0d1005so2990393f8f.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 14:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750109939; x=1750714739;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7emt/zNGr/CBhfVNgDPKicHgy2P2Bp4GbdXMzFzaVxk=;
 b=bjL30O/xfnHx7mEfL99TfAf4ILyQlxbNfGi0Sb50z1CM02XWa+j31L8/rPKX0xZ7Uc
 caJ4mqtueRfHhbvifn9fLiabTxn8NCDTD12wzZNzkGTqJLjNVolYpo1UroukOB8aZHGW
 qSEhQilYoyG4Cg3x8Gf5Euov7PmyzgZIfF84qG4ZprfMYRJnjGclzLjnEd+9qFGblZuo
 FFkmD5sGkb8ZJhVuYscoBQcw1hbBB3quGHPHoPFDDu1Ff6tP804PAdCD4IFAehJvLvkM
 mvbFtHToBXK5jwlqFwdKbPZ54niZpZs3MmWZHRHUxckErwOM8kJJDaDgMiAqJb9/l2Uk
 8w2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIa8A3va6b+7lnHRwyPlwTyEhmBDJWwhFkRsUiwzXUTykh4reUAI4HNn03GAIDuCcXG43a3rb2ZZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJxNvYjHUXv5CXZ8vCrsVcPUVJYtApFLoKBv+oxVr2RbWEg0ts
 DJWOvkAT4LrZjQphWOdxGBe6yoLDnPq7+k7fGsIxJLFaw74sJCuB36V5dI7Lkk2rhUiuupDDCaq
 k6yOnm86vTGZcGSeqJ5wyGBlFzWZZnBrompZKZF3QIQMqI/S1T7pLi7XrKPhZsEsHczSNDg==
X-Gm-Gg: ASbGncuzUQokZX+53eJEp1C6jjUOLM45q1eyiEdJrTOuHAdkJ+xXGRcoEKp9IPYtQRc
 sLZtl9gCMQS0DwAO2WJNUIsbM6q0ctCBDrH4Jy/MICi6y6ch2XrTmn6h2YasgJpB/vzhd9Hmn/w
 jI5j4zVbGYdyv+pniDhGxS3wJJ8uiVfnqxt06XQQPWe/2V8c2kF9fdIagisevEZQJe5OYn7HucI
 jr0K6KWf/7GtEOjya8BX/cVRU7ZAHkX6YdluHrP9EKTsHIDkSvZm84EkpiTzeXfuB3U2xOOXrWv
 Ahpw/ZG34uo=
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id
 ffacd0b85a97d-3a57238b522mr9595369f8f.10.1750109938548; 
 Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzpDB07Ow6Aq7oaibwATYH2bwGc1v46BbhwhcmxYHu7okQGHS3ELJ0eFf8b83N36p9EgRDvg==
X-Received: by 2002:a05:6000:400a:b0:3a5:2cb5:63fd with SMTP id
 ffacd0b85a97d-3a57238b522mr9595351f8f.10.1750109938128; 
 Mon, 16 Jun 2025 14:38:58 -0700 (PDT)
Received: from pollux ([2a00:79c0:662:b300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b089a7sm11887641f8f.49.2025.06.16.14.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 14:38:57 -0700 (PDT)
Date: Mon, 16 Jun 2025 23:38:55 +0200
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
Message-ID: <aFCO7_RHuAaGyq1Q@pollux>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
 <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
 <aE1RPZ_-oFyM4COy@pollux>
 <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACSVV00uwmuAC4eMi-4QiF4sOu4r9u8eXxyAgt83YS8Yfgoemg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hbqRye9tqYkvdWxbDvzHFfAkHS_tlHLh7nTu86dA6to_1750109939
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

On Sat, Jun 14, 2025 at 08:03:20AM -0700, Rob Clark wrote:
> On Sat, Jun 14, 2025 at 3:39 AM Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > On Fri, Jun 13, 2025 at 04:57:03PM -0700, Rob Clark wrote:
> > > For UNMAP/REMAP steps we could be needing to lock objects that are not
> > > explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
> > > VAs.  These helpers handle locking/preparing the needed objects.
> >
> > Yes, that's a common use-case. I think drivers typically iterate through their
> > drm_gpuva_ops to lock those objects.
> >
> > I had a look at you link [1] and it seems that you keep a list of ops as well by
> > calling vm_op_enqueue() with a new struct msm_vm_op from the callbacks.
> >
> > Please note that for exactly this case there is the op_alloc callback in
> > struct drm_gpuvm_ops, such that you can allocate a custom op type (i.e. struct
> > msm_vm_op) that embedds a struct drm_gpuva_op.
> 
> I did use drm_gpuvm_sm_xyz_ops_create() in an earlier iteration of my
> VM_BIND series, but it wasn't quite what I was after.  I wanted to
> apply the VM updates immediately to avoid issues with a later
> map/unmap overlapping an earlier map, which
> drm_gpuvm_sm_xyz_ops_create() doesn't really handle.  I'm not even
> sure why this isn't a problem for other drivers unless userspace is
> providing some guarantees.

The drm_gpuva_ops are usually used in a pattern like this.

	vm_bind {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify drm_gpuvm's interval tree
				// pre-allocate memory
				// lock and prepare objects
			}
		}
		
		drm_sched_entity_push_job();
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// modify page tables
			}
		}
	}

	run_job {
		for_each_vm_bind_operation {
			drm_gpuva_for_each_op {
				// free page table structures, if any
				// free unused pre-allocated memory
			}
		}
	}

What did you do instead to get map/unmap overlapping? Even more interesting,
what are you doing now?

> Once I realized I only wanted to defer the
> application of the pgtable changes, but keep all the
> locking/allocation/etc in the synchronous part of the ioctl,
> vm_op_enqueue() was the natural solution.

But vm_op_enqueue() creates exactly this list of operations you would get from
drm_gpuvm_sm_{map,unmap}_ops_create(), just manually, no?

<snip>

> > > Note that these functions do not strictly require the VM changes to be
> > > applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
> > > the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
> > > call result in a differing sequence of steps when the VM changes are
> > > actually applied, it will be the same set of GEM objects involved, so
> > > the locking is still correct.
> >
> > I'm not sure about this part, how can we be sure that's the case?
> 
> I could be not imaginative enough here, so it is certainly worth a
> second opinion.  And why I explicitly called it out in the commit msg.
> But my reasoning is that any new op in the second pass that actually
> applies the VM updates which results from overlapping with a previous
> update in the current VM_BIND will only involve GEM objects from that
> earlier update, which are already locked.

Yeah, it's probably fine, since, as you say, the only additional object can be
the req_obj from the previous iteration.

