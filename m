Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD6F356057
	for <lists+freedreno@lfdr.de>; Wed,  7 Apr 2021 02:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3A06E03C;
	Wed,  7 Apr 2021 00:32:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6326E03C
 for <freedreno@lists.freedesktop.org>; Wed,  7 Apr 2021 00:32:28 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u11so3579684wrp.4
 for <freedreno@lists.freedesktop.org>; Tue, 06 Apr 2021 17:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TBcLhKjW+lNY/xHMeacy+VBYq5BuH339oLlIaOMVibo=;
 b=IXhlNg1gk9Q3afzinJh5cGsiYymSXr6wkyTOm+Ds+w3bDDzzGycebedGuFeGt2igkF
 UvnbwZQWL8+jz7ieuQRU3urPeeMbecrBx7c3m7UFt6CPsgzAA1ofZo1YCPBuq61Uoxwz
 0p6yOSzuspqJxGLlok3vFVOyTvFUkVXiyf+ffLN+xBzfauX4lQ59J2b9WfTOxMB+PISB
 671VIA7N3yYMy6fn21stzg8rpYnrMp7n6LDndN6nye5QH+M0JSpbSRZ15vN90kbQ4RxX
 fOfQhp2IxS5nwJRqT3K43hxTvaHRmjQnOtk5ogFLQz3dUOwKhsZMYykLRXuVycBcbeD0
 8Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TBcLhKjW+lNY/xHMeacy+VBYq5BuH339oLlIaOMVibo=;
 b=X05bTOGbqtKRnBi3zXu9sDLhbsAFf2nZDrvonIURkka1kNS3HF9/MEhiBhErtGSavP
 xglAQBWE1qoqTkbHFOnFGWteiUU53vUVPQLlNsTJ7wyFS0+uHSV2R8vgec5TIOJ/BfT5
 ssGpqTWsebJWVgEMiGe4tTFjaDaL88jdXYszQunosCaSjKGoPPOBduZphIc411Bu19QI
 Rd2RK+moA1misKLz+Kyz4uBv6kbUrIT8RNfvrIAxjqjOX2Dv5o8P0HttGDdT6a4VtkNy
 quuY9WZIWtD4IL0DFBzep34TosJ1wtZ6DDjErVd1uIfniYyKUqJYyDhzpgQn5h+IZRry
 t5tQ==
X-Gm-Message-State: AOAM531h+9gsyNj3Uwr+5Vb5V6a0y7vnA9ELD0FAQ9etUcR4cGkqYRkz
 g8qLXZWqW00qEAMFHBR1lbN8Rrl0YTJCmF66UmcGqTZFz4k=
X-Google-Smtp-Source: ABdhPJy1ZhlxVS19+Yc8gcG2+QL19bhVjKgeEE0UjD9U4MdOCxq8CxV73gq8KOJ9Vp1y1ok/zkwogk/hw1PvbAdNMT8=
X-Received: by 2002:a5d:5612:: with SMTP id l18mr990419wrv.28.1617755545584;
 Tue, 06 Apr 2021 17:32:25 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 6 Apr 2021 17:35:54 -0700
Message-ID: <CAF6AEGvWq74nswoUWCMUcUGACDhZEs4BzCwuy18JrmR=NFPwTQ@mail.gmail.com>
To: freedreno <freedreno@lists.freedesktop.org>
Subject: [Freedreno] [Heads-up] drm/msm: msm-next-staging for v5.13
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

PSA: msm-next-staging[1] should have more or less what will be in
msm-next for v5.13.

I've done some testing on hw that I have with me, but I don't have
everything, so this is a good time to test and let me know if you have
any issues before the patches are merged.  And a good chance to double
check that there isn't something important missing.

Also, I've pulled in (at least for now), the swappable GEM object
support.  But compared to the patchset on list, I've flipped the
default to disabled.  It can be enabled with msm.enable_eviction=1 in
the kernel cmdline or:

   echo 1 > /sys/module/msm/parameters/enable_eviction

It won't do anything without some sort of swap enabled.  (On
chromebooks, we use zram swap, that is what I recommend since it is
not nearly as slow as disk backed swap, yet still gives a useful
increase in usable memory.)  Since we have a lot of generations of
devices supported, paired with a few different possible iommu's, it
would be helpful if others could try enabling it and report issues.
In the best case, it all "just works"(TM).. otherwise if at least the
iommu is working properly, you may see new iommu faults.  In the worst
case if the iommu is not working well, you'll get exciting random
memory corruption!  A good way to test is, with something running on
the gpu, run mmm_donut.py[2], ie. something like:

  ./mmm_donut.py --free_swap=1024 --taste=20 --chew=20

you want the free_swap param to not be more than half your swap size.
You can get a summary of the state of gpu buffers with:

  localhost ~ # tail -5 /sys/kernel/debug/dri/1/gem
  Total:     5264 objects, 328941568 bytes
  Active:       0 objects,         0 bytes
  Resident:    11 objects,   8527872 bytes
  Purgeable:   44 objects,   5591040 bytes
  Purged:       0 objects,         0 bytes
  localhost ~ #

Total minus Resident will give a rough idea of what has been unpinned
and swappable..  (it is normal for Resident to be *slightly* less than
Active, because sometimes userspace allocates things that it doesn't
use, or hasn't used yet, and newly allocated GEM objects do not have
pages allocated until first use).

BR,
-R

[1] https://gitlab.freedesktop.org/drm/msm/-/commits/msm-next-staging/
[2] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
