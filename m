Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988EB066BF
	for <lists+freedreno@lfdr.de>; Tue, 15 Jul 2025 21:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2D010E645;
	Tue, 15 Jul 2025 19:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="heiMVCWo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F7E10E630
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 19:25:19 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-73a44512c8aso1561901a34.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752607518; x=1753212318; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ofJOuQnwaL8gPzkrwRaNCRkxUIKaR9tFQY4znsAEw4=;
 b=heiMVCWoxwrSnWrIKpFXAsNd5cy95DFsx10vVv9jJX0cR28wgxz9Q55pSnDkzhVW/g
 P2BYgr4QMOfF8SOaykEWUFRDGTUti5X8CrmViUKRs4hU3WqzyF8q0gBEBfc5G+vFcK9I
 Wy1CLcy1Dj/RcVPOHRQQrA+ave6C1++G+tCPHgK6mm0qfXXiP34zis8nxVqojx+c1Kp+
 gCubw3/WYV8kOiTaC7XS8HFKjsPZEuptLSzzJ0xMdaYik+Mpgdl+PqimEatYu+dAL27g
 HKHlyTfJ769sXnc7+7SwttoRlFFku10g2YH9AdUx6Uq2LbTIP1E0HH2PA3XIhjA6GXpt
 FpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752607518; x=1753212318;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ofJOuQnwaL8gPzkrwRaNCRkxUIKaR9tFQY4znsAEw4=;
 b=RkhqD7S/lao/SmlwmuK7u9myLWEaZSdOWQd8Ku5XflGRfNBaIjDJPYg1ig3TaJ0pTn
 u89tAyvlCmXBmO9ZFMNq6E00AyFiYYUU9Sc43eCsXvXySIxLTKc2yn/74pg2m2ZyODYJ
 33OiIh6qGYXXvlTh5b0nEKZsrSM8QeVDtyXQ9o3Rc2FmJrmhVjMya3aaNUB56ln8eLSh
 N5AXAwuDtylvOChaqNipXYQ79bnedZsSxJMtLpn7ao4g5NPUm4A7v0ulLZMou1N6Zifw
 7aylGu4H/aUfC2vZwXsk4AGRHV7KT2EjZYyaMa1SuK0lhwfrDjgGHM4xRRXkBMi2UtOg
 xdlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNTwwU2OCwsuOnvP8c2UsEvgLU4jQ57gj8kkKDr+/ZpWKtsgxGZrqY7sd2x5m9zJAzbslJKcHgALc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvTeJMejQX0XVvuL/txStvQmGoQjsPH1hHm80nhuIWBGj+0sDn
 DFVlc0yRh1YJsEID9iMDDNSbxUJhmHP4iw2uBhY5YQ0XLQ+gFKGtSaAoKfslfDGXLGpw61SMdC3
 MHGw1
X-Gm-Gg: ASbGnctup6ZehPEiYZamgidcHBNKgEOnoHQXgWhSRQZ6dyvQ5oxEicxXbVD1Vl5flow
 B2G91HzffTrEZq7KjFUIYSndDo9EjqjIGDcitLTV6zuNOL5GJUp+9dOmkowE+QpTSl6eZCX/zph
 G1XuiDSW5LSi1TZgcI81vbvUYcqht6DXhQr8mcuRgsHYO9vLoUqG/q/p3mDyCCB45LL8ECrk/wp
 u/qT/fZyrP0jQ3oI+C8YlLC5QQsUk/Ws3iEbbNBPjvesN3gh7mu3xAte7mvFPAMiiFHzdZMJ4KN
 5/a7+lhtPr7rN+xzjCZUaN3tClY0HKkofqobY7f9es2pVvPOVehb08MkJEdGoJnT2VA/pqvMVuw
 1GwhIhsUwgHxl610VjJYukVbz8nbhT4s26Y+xTTY=
X-Google-Smtp-Source: AGHT+IH0UsF4awYSy87dNiScID5eXH435TcbPOt5aqfeubV8wnUSfcZEpEnsaZ8SOoPdJjjZOGDlnw==
X-Received: by 2002:a05:6808:3010:b0:41c:cbbc:8abe with SMTP id
 5614622812f47-41cf04d9d0amr203848b6e.31.1752607518370; 
 Tue, 15 Jul 2025 12:25:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 5614622812f47-4141c1ac3b5sm2292737b6e.35.2025.07.15.12.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 12:25:17 -0700 (PDT)
Date: Tue, 15 Jul 2025 14:25:14 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm: Fix submit error-path leaks
Message-ID: <55953f27-0762-4ef2-8dda-3208b34a5c75@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Rob Clark,

Commit 68dc6c2d5eec ("drm/msm: Fix submit error-path leaks") from May
9, 2023 (linux-next), leads to the following Smatch static checker
warning:

drivers/gpu/drm/msm/msm_gem_submit.c:816 msm_ioctl_gem_submit() warn: fd used after fd_install() 'out_fence_fd'
drivers/gpu/drm/msm/msm_gem_submit.c:818 msm_ioctl_gem_submit() warn: fd used after fd_install() 'sync_file->file'

drivers/gpu/drm/msm/msm_gem_submit.c
    751                 WARN_ON(ret);
    752         } else {
    753                 /*
    754                  * Allocate an id which can be used by WAIT_FENCE ioctl to map
    755                  * back to the underlying fence.
    756                  */
    757                 submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
    758                                                     submit->user_fence, 1,
    759                                                     INT_MAX, GFP_NOWAIT);
    760         }
    761 
    762         spin_unlock(&queue->idr_lock);
    763         idr_preload_end();
    764 
    765         if (submit->fence_id < 0) {
    766                 ret = submit->fence_id;
    767                 submit->fence_id = 0;
    768         }
    769 
    770         if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
    771                 sync_file = sync_file_create(submit->user_fence);
    772                 if (!sync_file) {
    773                         ret = -ENOMEM;
    774                 } else {
    775                         fd_install(out_fence_fd, sync_file->file);
                                           ^^^^^^^^^^^^
Once we call fd_install() the file is exposed to userspace and they can make
the fd point to a different file.

    776                         args->fence_fd = out_fence_fd;
    777                 }
    778         }
    779 
    780         if (ret)
    781                 goto out;
    782 
    783         submit_attach_object_fences(submit);
    784 
    785         if (msm_context_is_vmbind(ctx)) {
    786                 /*
    787                  * If we are not using VM_BIND, submit_pin_vmas() will validate
    788                  * just the BOs attached to the submit.  In that case we don't
    789                  * need to validate the _entire_ vm, because userspace tracked
    790                  * what BOs are associated with the submit.
    791                  */
    792                 ret = drm_gpuvm_validate(submit->vm, &submit->exec);
    793                 if (ret)
    794                         goto out;
    795         }
    796 
    797         /* The scheduler owns a ref now: */
    798         msm_gem_submit_get(submit);
    799 
    800         msm_rd_dump_submit(priv->rd, submit, NULL);
    801 
    802         drm_sched_entity_push_job(&submit->base);
    803 
    804         args->fence = submit->fence_id;
    805         queue->last_fence = submit->fence_id;
    806 
    807         msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
    808         msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, submit->user_fence);
    809 
    810 out:
    811         submit_cleanup(submit, !!ret);
    812 out_unlock:
    813         mutex_unlock(&queue->lock);
    814 out_post_unlock:
    815         if (ret && (out_fence_fd >= 0)) {
--> 816                 put_unused_fd(out_fence_fd);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
So this put_unused_fd() could potentially do something to the wrong file.
Traditionally, we either do the fd_install() last or we just leak until the
process dies and all the files are released.

(Hand wavey because I'm not sure how all this works exactly)

    817                 if (sync_file)
    818                         fput(sync_file->file);
    819         }
    820 
    821         if (!IS_ERR_OR_NULL(submit)) {
    822                 msm_gem_submit_put(submit);
    823         } else {
    824                 /*
    825                  * If the submit hasn't yet taken ownership of the queue
    826                  * then we need to drop the reference ourself:
    827                  */
    828                 msm_submitqueue_put(queue);
    829         }
    830         if (!IS_ERR_OR_NULL(post_deps)) {
    831                 for (i = 0; i < args->nr_out_syncobjs; ++i) {
    832                         kfree(post_deps[i].chain);
    833                         drm_syncobj_put(post_deps[i].syncobj);
    834                 }
    835                 kfree(post_deps);
    836         }
    837 
    838         if (!IS_ERR_OR_NULL(syncobjs_to_reset)) {
    839                 for (i = 0; i < args->nr_in_syncobjs; ++i) {
    840                         if (syncobjs_to_reset[i])
    841                                 drm_syncobj_put(syncobjs_to_reset[i]);
    842                 }
    843                 kfree(syncobjs_to_reset);
    844         }
    845 
    846         return ret;
    847 }

regards,
dan carpenter
