Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C2E82D578
	for <lists+freedreno@lfdr.de>; Mon, 15 Jan 2024 10:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A2610E21A;
	Mon, 15 Jan 2024 09:02:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5BB10E21A;
 Mon, 15 Jan 2024 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705309370;
 bh=sftk4d280l+HctfqAtKqHrcK/J3Px2D7IIXq4GsVvDg=;
 h=Date:To:Cc:From:Subject:From;
 b=K8KFxOQdS1ydMRB9VNADqLf5mNe9FEJN1/06TE4qFR9Lqyc7B+Qypi9qYceKL8+zG
 4ovabva4VCYnSaU+11e1BnTcVk+HsdOuxb1KjiRhfQH1jaKTds3SoUiLbncEZLFbC1
 BB+d+LT0TnCytncAhroB2BuEJyLxr7FDThSROanO5Am2NBVRdBFeV11JtlDRrvf/L2
 gPvmhsNekyzZdD6YhAKXypLKszsH+ZV4wdnGa1aPgbAVXQl3g7rv6RFyQxqbDjdTGw
 TCwi/TvbdwQObmNmDh8RGAAYhbhl5uXJ6shrxVkHIoRSMS6YuByhA2oBW0GUatYo5L
 i8gUcn8SZ90vA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 179043781F80;
 Mon, 15 Jan 2024 09:02:41 +0000 (UTC)
Message-ID: <46287831-edfa-78e8-6055-d7a08831c445@collabora.com>
Date: Mon, 15 Jan 2024 14:32:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Flaky tests for msm sdm845
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: sean@poorly.run, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com, daniel@fooishbar.org,
 quic_abhinavk@quicinc.com, david.heidelberg@collabora.com,
 helen.koike@collabora.com, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Maintainers,

There are some flaky tests reported for sdm845 msm driver testing in 
drm-ci with commit 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20240108195016.156583-1-robdclark@gmail.com/

=== msm:sdm845 ===
# Board Name: msm:sdm845
# Failure Rate: 50
# IGT Version: 1.28-gd2af13d9f
# Linux Version: 6.7.0-rc3

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53737049
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53737050
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53734294
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53714642
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53667209
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53647868
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53734121
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/53647999

# Reported by deqp-runner
kms_cursor_legacy@basic-flip-after-cursor-legacy
kms_cursor_legacy@flip-vs-cursor-toggle
kms_cursor_legacy@flip-vs-cursor-varying-size
kms_cursor_legacy@short-flip-after-cursor-toggle
kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
msm_shrink@copy-gpu-oom-32

# The below test shows inconsistency across multiple runs, giving
# results of Pass and Fail/Crash alternately.
kms_cursor_legacy@basic-flip-before-cursor-varying-size
kms_cursor_legacy@flip-vs-cursor-atomic-transitions
kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
msm_shrink@copy-gpu-32

I will add these tests in 
drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh
