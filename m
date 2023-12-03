Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F748022BE
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E62410E273;
	Sun,  3 Dec 2023 11:26:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031610E13C
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:36 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50be0f13aa6so1490290e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602795; x=1702207595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILn7PVh6aYBuIQEV/pLqqVkkuCaezFiyrMqK2tj/fnE=;
 b=mqoDIjW3SKp5C3VkZtmMkavf3dItzzoebvlyxrY9xcI2bksPaTA0Xo3yiExpRfrqlL
 tl5gUU+SRU8TTYz/pAW9mb4bQOVX5mQsWjQSqEOa+ERXxUaJITXAl7w8X3d2AWI2g2pL
 e45ZdGqPk0SpqI6ua/7/P5p6i7VrWRbMqvupaPztOWOtWxBVee9I+S6Dh8M54qVDIRn+
 HtJ2SN2ubicfEl5tg31Jh2urCcF9WoYRsijUgREZPebelPyXDn9ruD1W3xVwp2TFITrX
 osFXqiVDoiAZvSKi7uL/8G3GUqraKJeAOIp3bCchfXDIaCKboL5GMogiBZUiTle+m0sD
 N0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602795; x=1702207595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILn7PVh6aYBuIQEV/pLqqVkkuCaezFiyrMqK2tj/fnE=;
 b=LRhBKp8PJLCAw4TgvTcciH2G+9zGjqNwR0t4M+LtxvwexgL1bekZ4upC1zxMMbm/qH
 6Pxe9BPJTwuembk+RTR/lSwdOM5wlplKSHU1Pb1ot6GozoieO+Tbb4GJPbd4WrcmCr9+
 9QP+OsAo741Rpht9ASf5KWYZHjPEqNeFlkyUMkkAgtxtIEEZn52QLUyYDXV5l7D1akH0
 nBjP6EH3+9ZEXswC93iMmn3WUa/w3dSVrSqu9oc1FDvP+Xpatn8OZS0nROj9BUprd1iw
 tgvdFvy4cxMnWjQdeT9R9nh0TatJqGZZaMeyQ4gwolnF6z6G7vk28OhTdepC//GnbgIe
 CcBQ==
X-Gm-Message-State: AOJu0Yw5TbES7Kxcg1CVlkogmaab/JjmvwDQaMrakHBGDbrgAIXIR5ov
 Y9/GaDFDV61EDvG/BxEpBFIhbQ==
X-Google-Smtp-Source: AGHT+IE9COw1Y68kTBfxxsXnuXRJ3h2E+eC8l9YxhsjXV/OdXFAs/7OMg0yg+x2mIKvHKolp2c/eUw==
X-Received: by 2002:a05:6512:2812:b0:50b:f0a9:1e3e with SMTP id
 cf18-20020a056512281200b0050bf0a91e3emr557443lfb.3.1701602795005; 
 Sun, 03 Dec 2023 03:26:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun,  3 Dec 2023 14:26:19 +0300
Message-Id: <170160265546.1305159.14134248616774170208.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
References: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: cleanup debugfs handling
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 19 Oct 2023 13:44:19 +0300, Dmitry Baryshkov wrote:
> Currently there are two subdirs for DP debugfs files, e.g. DP-1, created
> by the drm core for the connector, and the msm_dp-DP-1, created by the
> DP driver itself. Merge those two, so that there are no extraneous
> connector-related subdirs.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: cleanup debugfs handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab8420418c2e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
