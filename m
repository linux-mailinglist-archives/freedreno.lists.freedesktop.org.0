Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8607870FB68
	for <lists+freedreno@lfdr.de>; Wed, 24 May 2023 18:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BBD10E4DD;
	Wed, 24 May 2023 16:10:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8B710E4C1
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 16:10:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6077660c6so9996345e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684944617; x=1687536617;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sonO3GOYzGccW/51txZZdB4M9CGgorlp/b5UFoGyaco=;
 b=huJrIL8GrNYmxaL+91OktyHSNGC4Uj9H6LgChlHFde8wRuazQA2qKQx6gCLm5EeUL2
 ChyzSS3yZGt2x8Op/sPCRDNJ0ZBVe22BFbk5n7wqOh3LXQN3gNw2KahY5+Y4d7fAPypg
 guLngSIAs+OA9FpyZelrGBAx01iPnej6Pxh7AaBFHLpBkcLKz4zj5MECgG68A+pkFuSl
 W2tTk2kgJLFACbkK6DcSAREyG9sqVzJko7HCcFQROj/IKjqcPi5ksUUb75URizrZUeDH
 1pJkY+oznh25umOaeF2AuwhXQ6sJXhvqLrjKjkeTnLqslRGHojbcxLvb+wlSlazue9a9
 NfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944617; x=1687536617;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sonO3GOYzGccW/51txZZdB4M9CGgorlp/b5UFoGyaco=;
 b=P2yPU+B2U07LEZ5whXhxdQU8B6bq4l630EpLgiu6EN0WyTSJtZjH0qiNzl+3adGf1p
 xlIZVPQV+CuJwyjBHL07NLDEcL0JnqLvqYrOV1JX7xA3JokaYcdm9U08GqdL+qE4QzOC
 ZeF+zrbnoHLnWA3Y50r5ZSyEe8jgvxiiSTVsfxKT47BjEUPE3ZFX7pkHSb7ZTkq/2FWl
 fPjo4OYzFGRtOnZUOieEan13eY9ScNpJzBWT+pu8RM5L8mqh2szYfMw4SV5Zkw+5V4lF
 0Vq4WVofMS7LUrfddTwbVTh+Gv07oOrlZRssxxl115HWK+fFeGmc+4OfFT5GbqRgCL1g
 lOQA==
X-Gm-Message-State: AC+VfDw2VZID+eIZPObxKNwCcxI378hL3h+/xrHG6O/r1rRahjanCJbx
 sHTfvLCmNLWAI6aEuoBAWnyGaQ==
X-Google-Smtp-Source: ACHHUZ6TpR8oaLW3NZ/tDgs34qpc3OAVHAqUENH6gjAtwJ10LJtGbVpmkQsfflTucQ7R54D29ZedZQ==
X-Received: by 2002:a7b:ce87:0:b0:3f4:2327:53c2 with SMTP id
 q7-20020a7bce87000000b003f4232753c2mr248128wmj.19.1684944616955; 
 Wed, 24 May 2023 09:10:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003f4f89bc48dsm2865399wml.15.2023.05.24.09.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:10:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
References: <20230515143023.801167-1-robdclark@gmail.com>
Message-Id: <168494461551.3403386.4095735722928777312.b4-ty@linaro.org>
Date: Wed, 24 May 2023 18:10:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Subject: Re: [Freedreno] (subset) [PATCH v4 0/9] drm: fdinfo memory stats
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
Cc: linux-doc@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 Chia-I Wu <olvaffe@gmail.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jim Cromie <jim.cromie@gmail.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Peter Maucher <bellosilicio@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, 15 May 2023 07:30:07 -0700, Rob Clark wrote:
> Similar motivation to other similar recent attempt[1].  But with an
> attempt to have some shared code for this.  As well as documentation.
> 
> It is probably a bit UMA-centric, I guess devices with VRAM might want
> some placement stats as well.  But this seems like a reasonable start.
> 
> Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/9] drm/docs: Fix usage stats typos
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0020582a8afe9a8570f80ec503c59bf049a616de
[2/9] drm: Add common fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3f09a0cd4ea3b9d34495450d686227d48e7ec648
[3/9] drm/msm: Switch to fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=51d86ee5e07ccef85af04ee9850b0baa107999b6
[4/9] drm/amdgpu: Switch to fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=376c25f8ca47084c4f0aff0f14684780756ccef4
[5/9] drm: Add fdinfo memory stats
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=686b21b5f6ca2f8a716f9a4ade07246dbfb2713e
[6/9] drm/msm: Add memory stats to fdinfo
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3e9757f5ddb98238226ad68a1609aa313de35adb
[7/9] drm/doc: Relax fdinfo string constraints
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=90d63a150b85fd1debb9c01237fb78faee02746a

-- 
Neil

