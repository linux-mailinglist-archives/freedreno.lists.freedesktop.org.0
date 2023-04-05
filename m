Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6386D7210
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 03:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B658B10E81E;
	Wed,  5 Apr 2023 01:35:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3210E818
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 01:35:56 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id h11so37703073lfu.8
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680658554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwyKfYot14ilHFAuMsDSrEnz1jRBc3hhgB3iT23xYhE=;
 b=ONIpd1vjARZP+35nzzjgfUh4PEVlWWC35WPRmcVal4ZdGeEvj9PqWXFJH5xXCyExCI
 qMf0C7IU9UAHRUV0I9sN3QPuebaOsuftGBUzKouXsZQQB/HgkdTB2LmwdGSFZAFk18TC
 7Z0X2Maidg3ZYhOWLfRXsScJyJ+J9KZqpkE9iqiIUEIex5NxKxBls0UOuIv9kAmJLRD9
 H2xybN1ynIak8Ec8VS5zDV3TmXdcyaO56zSaYS3XNTGaBCPluAvYufSRxmyIKCJFeQYl
 nSzAUmZrQdRmpELm4iwubEZC1cKmlu41B7hoJnriKdLcsghZT0dCNgqeYWjBZCNbGI/q
 YUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680658554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwyKfYot14ilHFAuMsDSrEnz1jRBc3hhgB3iT23xYhE=;
 b=MXIkNQ6PeBWK9MxO4SgG7qx64e/zIssJ0Q69sWxWngVscVEnc4o45GxqZXmq6HT6VP
 j/0OborYtbM9FZI7WBTarv7JP13l/s/O4a2Odi6E4gMOu4lNAiMd08EFLsc+cJBR+usI
 i8Ynbwh5ggxqcTZNUXEYxYMIocUlyFnAAQQ30m7xa5jiQE8PU1c18G+uxwjtVW+GWoRY
 m21PFZcaPiYthZ7UWkDpkps8m8Anwkwu/GX3wsDORGcCiQwwT+RukCYNH9KUT2fy1LKB
 rlXGg+epxzlOsozqllfvI58ohDxbEgFtEQThJ6hVgPYbPu/iQ7rgZN+vwAk9pRqLtnrE
 wKqw==
X-Gm-Message-State: AAQBX9fLcu6FBnaYYhpjGeqjgzBcoPMZRW1PKo5DPqHCqlyMV+iTy3in
 ACyIPY6nnGAhSin1uNpta/fE7ZsmmetKWp21eua/Qg==
X-Google-Smtp-Source: AKy350boE/H6gPEad6PwVsvSiLw29ItUe8nLR83QFFV6AmP5ydeMXJNTR7nzAlkA1vPgqFHsALYpgg==
X-Received: by 2002:ac2:5a0c:0:b0:4e8:43a4:2baf with SMTP id
 q12-20020ac25a0c000000b004e843a42bafmr1009075lfn.33.1680658554618; 
 Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 v26-20020ac2561a000000b004cb8de497ffsm2572326lfd.154.2023.04.04.18.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 18:35:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed,  5 Apr 2023 04:35:51 +0300
Message-Id: <168065850333.1260361.14774983089161239922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403124538.8497-1-tzimmermann@suse.de>
References: <20230403124538.8497-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 0/8] drm/msm: Convert fbdev to DRM client
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 03 Apr 2023 14:45:30 +0200, Thomas Zimmermann wrote:
> Convert msm' fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in msm is now just
> another DRM client that runs after the DRM device has been registered.
> 
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
> 
> [...]

Applied, thanks!

[1/8] drm/msm: Include <linux/io.h>
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62c58ffe011d
[2/8] drm/msm: Clear aperture ownership outside of fbdev code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4de16da5b40
[3/8] drm/msm: Remove fb from struct msm_fbdev
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5ddc0f1a7bc
[4/8] drm/msm: Remove struct msm_fbdev
      https://gitlab.freedesktop.org/lumag/msm/-/commit/09cbdbafbe9f
[5/8] drm/msm: Remove fbdev from struct msm_drm_private
      https://gitlab.freedesktop.org/lumag/msm/-/commit/37e8bad3ae5d
[6/8] drm/msm: Move module parameter 'fbdev' to fbdev code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2fa4748b5ad8
[7/8] drm/msm: Initialize fbdev DRM client
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7e563538d210
[8/8] drm/msm: Implement fbdev emulation as in-kernel client
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5ba5b96d3327

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
