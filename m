Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA2744C900
	for <lists+freedreno@lfdr.de>; Wed, 10 Nov 2021 20:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFBD6E0FE;
	Wed, 10 Nov 2021 19:34:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7B46E055
 for <freedreno@lists.freedesktop.org>; Wed, 10 Nov 2021 19:34:19 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id f7so1979452vkf.10
 for <freedreno@lists.freedesktop.org>; Wed, 10 Nov 2021 11:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rJHh7eaoz0rtcELxkvF4zn32urxXqVSFngW+4w2Rf1M=;
 b=ggo+wNiLpDV4HHVswfBVwjZWHVRwN5LJPcalbUOFWVu2vONM7Gc4p9hUv3qjOc/k4d
 1JORW4pmS0ObxFh50/8lVekzBekj5VaHNWn6O2mShfZT+FJoWWrbLaIj68Mzk6YZUQIG
 BCDQrOwq8mlrpQH2MSxaZNS2aTsk6/OnnOnU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rJHh7eaoz0rtcELxkvF4zn32urxXqVSFngW+4w2Rf1M=;
 b=IltlaU9HJhjgowzXPbnCVTl9olGQXp78jrmsQ7EtvRmvxf6b2XoGscwbC0wuA4gRJ+
 p9dW7dEe34IFtKhBVDwVoLOMH4gNZ0aWf6bC4OYznglpsjO6FURLSC1lcLL1jgjXZOYM
 tVgw4JI+rLp824YSDTR9WIGZ6Vn6gHhsWMUG7UHM/zkmcenntzW8fBpDhDlqeCkiFXnx
 Bjhm2+lNdz12vtPPDaLaAAIL2RwhBCNlNNks3stHRBiC6XcNy+J0k9fs7yHnOo2qCEqM
 3TPxiDQT0zqYj55QiJ91B+0+J3U9K8upJM9CoVwKkNmdaMPW9OZxmCdTM+rrP26oxh4l
 78qA==
X-Gm-Message-State: AOAM532yYqgxGQzHx3EkuoIbNcpI9hDiK1v/pHSM+pOo3NWK4R+NMDA2
 pJJD5Nzj5H3f/lfEUIAFsLIMYg2u3moRkdw6
X-Google-Smtp-Source: ABdhPJzlHwHz24c2zSNl5Hhws4WdVA+lO8Bb7anT7lg2ow9nWr7ZPTW+kv06o3GES2gBTLH2T01e9Q==
X-Received: by 2002:a17:903:408c:b0:142:45a9:672c with SMTP id
 z12-20020a170903408c00b0014245a9672cmr1542283plc.7.1636572847553; 
 Wed, 10 Nov 2021 11:34:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6e36:1327:faf4:fa6a])
 by smtp.gmail.com with ESMTPSA id d7sm437006pfj.91.2021.11.10.11.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:34:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Nov 2021 11:33:42 -0800
Message-Id: <20211110113334.1.I1687e716adb2df746da58b508db3f25423c40b27@changeid>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: Fix mmap to include VM_IO and
 VM_DONTDUMP
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In commit 510410bfc034 ("drm/msm: Implement mmap as GEM object
function") we switched to a new/cleaner method of doing things. That's
good, but we missed a little bit.

Before that commit, we used to _first_ run through the
drm_gem_mmap_obj() case where `obj->funcs->mmap()` was NULL. That meant
that we ran:

  vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
  vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
  vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);

...and _then_ we modified those mappings with our own. Now that
`obj->funcs->mmap()` is no longer NULL we don't run the default
code. It looks like the fact that the vm_flags got VM_IO / VM_DONTDUMP
was important because we're now getting crashes on Chromebooks that
use ARC++ while logging out. Specifically a crash that looks like this
(this is on a 5.10 kernel w/ relevant backports but also seen on a
5.15 kernel):

  Unable to handle kernel paging request at virtual address ffffffc008000000
  Mem abort info:
    ESR = 0x96000006
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
  Data abort info:
    ISV = 0, ISS = 0x00000006
    CM = 0, WnR = 0
  swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000008293d000
  [ffffffc008000000] pgd=00000001002b3003, p4d=00000001002b3003,
                     pud=00000001002b3003, pmd=0000000000000000
  Internal error: Oops: 96000006 [#1] PREEMPT SMP
  [...]
  CPU: 7 PID: 15734 Comm: crash_dump64 Tainted: G W 5.10.67 #1 [...]
  Hardware name: Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform (DT)
  pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
  pc : __arch_copy_to_user+0xc0/0x30c
  lr : copyout+0xac/0x14c
  [...]
  Call trace:
   __arch_copy_to_user+0xc0/0x30c
   copy_page_to_iter+0x1a0/0x294
   process_vm_rw_core+0x240/0x408
   process_vm_rw+0x110/0x16c
   __arm64_sys_process_vm_readv+0x30/0x3c
   el0_svc_common+0xf8/0x250
   do_el0_svc+0x30/0x80
   el0_svc+0x10/0x1c
   el0_sync_handler+0x78/0x108
   el0_sync+0x184/0x1c0
  Code: f8408423 f80008c3 910020c6 36100082 (b8404423)

Let's add the two flags back in.

While we're at it, the fact that we aren't running the default means
that we _don't_ need to clear out VM_PFNMAP, so remove that and save
an instruction.

NOTE: it was confirmed that VM_IO was the important flag to fix the
problem I was seeing, but adding back VM_DONTDUMP seems like a sane
thing to do so I'm doing that too.

Fixes: 510410bfc034 ("drm/msm: Implement mmap as GEM object function")
Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/msm_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6b03e00cc5f2..ae18bfb22502 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1056,8 +1056,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	vma->vm_flags &= ~VM_PFNMAP;
-	vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
+	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
 
 	return 0;
-- 
2.34.0.rc1.387.gb447b232ab-goog

