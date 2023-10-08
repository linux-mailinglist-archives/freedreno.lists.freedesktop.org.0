Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01FC7BCEBD
	for <lists+freedreno@lfdr.de>; Sun,  8 Oct 2023 16:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF0110E196;
	Sun,  8 Oct 2023 14:01:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B1D10E179
 for <freedreno@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-505a62d24b9so4407981e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773685; x=1697378485; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8n7pZomMrAHp2Dfup6BtVrM6UnZwRhQLuymH3hRrOlg=;
 b=i/yHB5gL6aBAVObEmz1OQJSnXwyV1ODYBCzNqAvYbTd2+cBnTyPgBrQyfoI1th3GWB
 cXmTtTOHq/HWwMryC6Vhw9Fet13AQDgvNutqgHKCI06OeFIbBOoLrYOaJ0Skei7YtsLL
 lVaUa5YT4NW28vxtauIxrr1DBb9Zq0GIxwhNt+Ho+3IM6l0L+cAEVdJUkThFb1EDOVZQ
 PW2KJl3Cy2XrQql4xAuNG2K8SKRmLVijoF2QLELiC4N5/oIKkG8OLF6sbq/FpsWiIJ4u
 LR+hu7aPix+d4YQ1niWjkWQDE6h8bBZqCe+afthYqPgXcpvew+1hHfMFKb83MMQcS18u
 gn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773685; x=1697378485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8n7pZomMrAHp2Dfup6BtVrM6UnZwRhQLuymH3hRrOlg=;
 b=b1LgDJwBa+VLLe7h230cmhrgUoWGfLmL4LhrgpqCFzzj4+5d4SiWFZ9l1c1sQqwuwL
 el1avPiO5/y2KTpu1UqcKpwuZ4aZN2xd137hdNpcAngMegX6N5rjb+o/GFFZhu+tyFKj
 /Y1H2uTfXR19yBaANj4mmOrtP3i47zW6H7tricNxExubk4eyvophsO6VxfFBMXk2LkLl
 RdnCfa2jXCs3FYm/4H5K4ghm7kf0c6zMN5OydOqT1sXr5hLipw5371SkcJhyQl/aPdsr
 NP2TyWjPm1IaCPSX7nMvEuX6TSN/RMma+oP9Hk33bCPOXGCGXX3j/S1PyUxyThdAtltR
 6Tpg==
X-Gm-Message-State: AOJu0Yz92OCO+Uq4aRefHsVK2pwUE0B8qXsMv29uePpj9KEXpcDdotpy
 IeX5SOzQ1+bTnyhGpckJ+0Amcw==
X-Google-Smtp-Source: AGHT+IFDfQUAPvgY1MXQjzjFHEO2hanMo7IIqxbsR4YfDzb/+L0dZxGBT76E70tDqOjQ0yvi7d2q5Q==
X-Received: by 2002:a19:e05d:0:b0:503:3804:d2ce with SMTP id
 g29-20020a19e05d000000b005033804d2cemr10523580lfj.35.1696773685410; 
 Sun, 08 Oct 2023 07:01:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Sun,  8 Oct 2023 17:01:16 +0300
Message-Id: <169677306906.2570646.12332008426708979775.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 0/4] drm/msm: Enable widebus for DSI
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 22 Aug 2023 10:42:03 -0700, Jessica Zhang wrote:
> DSI 6G v2.5.x+ and DPU support a data-bus widen mode that allows DSI
> to send 48 bits of compressed data per pclk instead of 24.
> 
> For all chipsets that support this mode, enable it whenever DSC is
> enabled as recommended by the hardware programming guide.
> 
> Only enable this for command mode as we are currently unable to validate
> widebus for video mode.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: Move setting of dpu_enc::wide_bus_en to atomic enable()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/97aab03bb3fa
[2/4] drm/msm/dpu: Enable widebus for DSI INTF
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c9b7bae463bb
[3/4] drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5467774e55fb
[4/4] drm/msm/dsi: Enable widebus for DSI
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4b90679c6864

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
