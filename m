Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9996CD44
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 05:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A43F10E4F8;
	Thu,  5 Sep 2024 03:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cT22g6Od";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64DA10E424
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:42 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5353cd2fa28so225625e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507221; x=1726112021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aqec3x8yKQ8GNkqH8zbywynntlgO/egZS4W8KKVbNqw=;
 b=cT22g6Od2gDwFsie3TwrlGvP1IcHJb1ewR6X8lwftkqggMi12Hhe7vQ3Xpnhjw7Qek
 NWD4DChfuGwoQ2vnbNrbRxRg2Gzuk1VXImZmEmnBuUo7khlMKYuBhCDjdFZVarwEZp/Y
 zTaeXKkzh+snVQvmotcXGxU0H6lI2+B2JTSWDRNw6U0CWXU0eC3M8jUtQUDF3zl5f7LL
 70itRSJkR4ouewgse+RX4QPSED0GvIAjDZ3WqNe+C+f7P47kNHW3/n9joJFy6g08D4V9
 p7md5UNw/0RuysrcZtryv10U8MKu295L7sz+bD8E+aXKWFsCA0yOg3Ft6P1c5Wqot9hZ
 lQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507221; x=1726112021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aqec3x8yKQ8GNkqH8zbywynntlgO/egZS4W8KKVbNqw=;
 b=new711lQLGKM+ODB1htWVCNMoJBM3hma+ojWIKf03t8UwfFcc+7HDuRpfq3+M8DLoQ
 u0mC881aCnYMuRGuK4WeApMcLv6idlLfd8EJnb4CloxgMVRPcfm+FRSAGlPpaTJeSFve
 it8ZPGJZLESj90ydR+J6IeCCZJELiQo7qEXJiB/yWMDpRCq0mZs90tpO72GNllNuuEuC
 J2ZdKCi2IqKdHrIv5gdG7G67BPa4XeQxFGIPv5bQ40qe5fX8Q0xnS9wg+PCmpQt2owtx
 CmYEuwQ6Ax7gRSNnIMkLIMCzAHwy8hpJGwHUFyY/zPU2kYgpvqs4dl2Hnn80G9GkqpzM
 WKsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBbTeEYxiM42yNAfKbeUZQelPA5seC8l2bADXOi38ayuLIZ14v3UfwiiXXnKYI4khADSIMJebET1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxpOBTDqa3YmCBM1js4z2OUcA57NEp0+IYiaDRQlHUiYqTEp/k
 my9u72W7w7WkQ4ALFVHRkAgsTKj3SV/5Q19FubozZIMn2Q8hRdMFNzCGzLPa3fA=
X-Google-Smtp-Source: AGHT+IHwr2P89i+YoHLpfciOuqT/Ni+vf4PPY9+DaJVEGxa0pgv2FB8yOQMf3G/eqwSKdCDS2nyzfg==
X-Received: by 2002:a05:6512:3e0d:b0:52c:f2e0:db23 with SMTP id
 2adb3069b0e04-53546ba07ffmr12737991e87.40.1725507220865; 
 Wed, 04 Sep 2024 20:33:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3] drm/msm/dpu: Configure DP INTF/PHY selector
Date: Thu,  5 Sep 2024 06:33:34 +0300
Message-Id: <172550712143.3299484.13998129049671917393.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
References: <20240625-dp-phy-sel-v3-1-c77c7066c454@linaro.org>
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


On Tue, 25 Jun 2024 23:24:58 +0300, Dmitry Baryshkov wrote:
> Some platforms provides a mechanism for configuring the mapping between
> (one or two) DisplayPort intfs and their PHYs.
> 
> In particular SC8180X requires this to be configured, since on this
> platform there are fewer controllers than PHYs.
> 
> The change implements the logic for optionally configuring which PHY
> each of the DP INTFs should be connected to and marks the SC8180X DPU to
> program 2 entries.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Configure DP INTF/PHY selector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/be3415c620d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
