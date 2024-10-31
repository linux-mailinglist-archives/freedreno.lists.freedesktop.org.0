Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B093B9B86EA
	for <lists+freedreno@lfdr.de>; Fri,  1 Nov 2024 00:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A63210E94C;
	Thu, 31 Oct 2024 23:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JMoVfvnK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4230610E94D
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 23:17:51 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb5a9c7420so15397561fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730416669; x=1731021469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lll2oecR05rxr53p0AjzsKoWCjFTY3cjM1CQZ34f94Y=;
 b=JMoVfvnK1U+yeO0m6Vxng3n9h02uvtV57w2kmfnRU1Y6yl5BBHjWUOb7DqmkItZ0Ss
 j5tVOzI9wH+zx6TPR/mOZf2kZVS8/dhPILaD9jhcBaVOoPrcOOD7AXTFB6Tz6HYAns/P
 FwHjCZwLPwjyimCQpkYRuVuS1esv31L7NjfTra44mnS7H70VZTx225xhD15mWEHbjQYV
 B1wm6tWO3UZG7WQf0Q+nd9Q+/FcHqKRM7sZIDcglpEWWg4rwiuR1N/E+irIgT814kyCz
 UK9I5LYdzDzU0bJjkOtepRhHCP2ig99RKrlpQ20H97/381+HalTRgD0rg9VqoifFIZ3G
 JBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730416669; x=1731021469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lll2oecR05rxr53p0AjzsKoWCjFTY3cjM1CQZ34f94Y=;
 b=P4KngWymudVRk3b/ioqLtNETsVIKdx7IiWq9yusAdxzF8HgEpWTnQhL4anZyKRRGGO
 sIdp6NgKc9VmbBB6nauFXbNdZBa2QocWYbio/P0n0jXwAXMQ9uZZvDTjU0lS2mnzftay
 UJ+RbZlTuyX9FYzdMKOQCtImDSZUrrzlzksw7GobWzc9GjnV/ADpDnGVXdHUM84fAAHt
 R+90P2Q9aBwN13u8vnyigmVgCWnNwPd6xSytKl6I7yL5H8Y6OZd6ihNUAzpx/3SkDInf
 YRdowEWJ1xcmjEFWxgQfmXiiRBKf6EG5+pV1tS53h4X9xbg/gJibRnRMvTlksjKhscdV
 G8xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlRRcjbEjc8G1/E29Kum57moXR8k/M8gh22Jj4dXElTyIcdECrkRg3W7hAkVqfBET+GcrNbRgFNIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ8U/Gs89F/GIPxQK2mY2Xbv4mV/6Spygq0M7vmbLsz/jP1qfB
 jTHgYjRqw21z8Nsf77SZ4AvdS9R+YZlRpJgzxNVkGCsLTjlGTPr2SUUNZlwipsI=
X-Google-Smtp-Source: AGHT+IHu3vlLdbVEh7NZJQs0I2jnIdpwbBUwg2vKoG77QJiTFiqvwPTZ8gS1SAL6o71LYqNS7hbRag==
X-Received: by 2002:a05:651c:160f:b0:2f7:64b9:ff90 with SMTP id
 38308e7fff4ca-2fedb7964a1mr8398921fa.9.1730416669178; 
 Thu, 31 Oct 2024 16:17:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef617ad0sm3536041fa.67.2024.10.31.16.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 16:17:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 0/3] drm/msm/dp: mass-rename symbols
Date: Fri,  1 Nov 2024 01:17:42 +0200
Message-Id: <173041664077.3797608.9986077411364114965.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
References: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Tue, 29 Oct 2024 22:28:23 +0200, Dmitry Baryshkov wrote:
> The LKP reported [1] a symbol clash between the drm/msm/dp and the HIMBC
> driver being sumbitted, because both of them use a generic dp_ prefix
> for a lot of symbols. It's a hight time we made msm/dp driver use
> something less generic, like msm_dp.
> 
> [1] https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dp: prefix all symbols with msm_dp_
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fb7d509b1710
[2/3] drm/msm/dp: rename edp_ bridge functions and struct
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f47e87b07935
[3/3] drm/msm/dp: tidy up platform data names
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c36a410780a3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
