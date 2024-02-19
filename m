Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7985A348
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 13:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA9410E3B2;
	Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nIdbP1rp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D2810E393
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:50 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5129cdae3c6so2585902e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345848; x=1708950648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6sp39V9/P58ZsOOZzf2qvTJrJfggpOrhkMb0iBsxVm0=;
 b=nIdbP1rpiYE0vzQyxWnG60CAJqCJv9Bnr53afdB3RCH0FT+S4sTFG3bGRiCBPTkYrz
 HMiBuKXMpHywJcwyoHnrN+CjmDOwS/EBYDn4/bhFJvmTd/soJMXMCv2y9DZekx0oMgK4
 OgDh/RMvRLwrYxq71jj8kez3qFDGfezCr7Lm0Vdtj0NXqB4t+rytGayz/f3owWs4Lv/3
 DDMSPCqsnzhgHcVih5iWyr96npsR9B1b4pO7FEoOnlJ0XqtZ9HSEqbebQlNLzTfu1qsN
 fWS4srtpa/dQ5DafIYQddY3itajFoD/qGPc9C1HXQXYpZq75B4cviZWaKbwopaZ1rt4G
 baHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345848; x=1708950648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6sp39V9/P58ZsOOZzf2qvTJrJfggpOrhkMb0iBsxVm0=;
 b=bDnHHJIhLHSvRVE0/FeyBHRwKJZA6Dy/8QAN5VgDdpgDyXXozQblSC99cOcVpWtnot
 EVal8MQv1K4mt1Wr0w/MDNN0kfpe8lq2ins71RXYVDtGPcM0mwMFIklT2dhRD+bnfhBg
 pVYd7zmSJzUpuDUamY3I7PMjxv28RIuWsxol7S5iT9p5Qe5X94BVCHQshxSttOT7Xi80
 PlVXn0uAqiSE1MrwpgrqMt+TtXq3yhHUkFk2cKLF/bDhZge3hHVLV/+aGFbp5FL4fy+M
 J/OsXxKdIXMzkKTcyHu382IGWIBHh3p4TUNOIfofzOLuAJhPwsSHODYKKJUgCXZ1j61f
 hpcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOG+olQMM3Gbu+h2OXf2763LQ2NCUK7ANpe6Hmei0D05tcpiAYRkbYkxewM1oDjAyajA45M57sHchqJ97fdc5E6nQjC2Gjv01ySrdrNwR9
X-Gm-Message-State: AOJu0YzOFxgpmPEpRlqvukYFMc7g49f3oT+sB74v26e/ivxmS3hi1FX/
 BGCJqzSXp+fADvubhlidGvklLgTi+PDnVKaQPeY2WoudkPPWa2WlXtH5ZAfNII8=
X-Google-Smtp-Source: AGHT+IFoZP6/ZG8y/H4k48B54cjghy50oBw/WDFb9BTk0tJ7f6x7I94swyk/24k8TDQUDaXjP0IOpA==
X-Received: by 2002:a05:6512:220d:b0:512:ac4c:abf7 with SMTP id
 h13-20020a056512220d00b00512ac4cabf7mr2834148lfu.65.1708345848701; 
 Mon, 19 Feb 2024 04:30:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v4 0/4] drm/msm: provide migration path from MDP5 to DPU
 driver
Date: Mon, 19 Feb 2024 14:30:35 +0200
Message-Id: <170834569501.2610898.9932991844381586058.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
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


On Thu, 08 Feb 2024 17:01:07 +0200, Dmitry Baryshkov wrote:
> Over the last several years the DPU driver has been actively developed,
> while the MDP5 is mostly in the maintenance mode. This results in some
> features being available only in the DPU driver. For example, bandwidth
> scaling, writeback support, properly supported bonded DSI aka dual DSI
> support, DSC (display stream compression).
> 
> All the pre-SDM845 platforms were originally supported by the MDP5
> driver only. However it is possible and easy to support some of the
> older SoCs in the DPU driver. For example in the v5.18 it got
> support for MSM8998.  This can not be considered as a proper migration,
> since there msm8998.dtsi didn't describe the display hardware
> beforehand. Instead new bindings were added, making MSM8998 just another
> display hardware to be supported by the DPU driver.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/mdss: generate MDSS data for MDP5 platforms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d2570ee67a47
[2/4] drm/msm/dpu: support binding to the mdp5 devices
      https://gitlab.freedesktop.org/lumag/msm/-/commit/39b06ed6d4f3
[3/4] drm/msm: add a kernel param to select between MDP5 and DPU drivers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b8b123187035
[4/4] drm/msm/dpu: add support for SDM660 and SDM630 platforms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7204df5e7e68

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
