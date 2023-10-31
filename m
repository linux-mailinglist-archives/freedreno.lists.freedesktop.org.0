Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67037DCDCE
	for <lists+freedreno@lfdr.de>; Tue, 31 Oct 2023 14:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895DB10E4C6;
	Tue, 31 Oct 2023 13:28:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F185510E4C6
 for <freedreno@lists.freedesktop.org>; Tue, 31 Oct 2023 13:28:33 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d9a398f411fso5084282276.3
 for <freedreno@lists.freedesktop.org>; Tue, 31 Oct 2023 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698758913; x=1699363713; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vkk8ZCgsYoi/AnkxKAKmjXFYbNerVSNaR8gjvx3gGLI=;
 b=A5aIwVdFUeCOwBl9/k9hXTVIBPOJURzijbmykluwKO5e1CtUB+XO3Pm6QQPQbIcnc1
 EXpmmW7O4eU+vd1iumF08nT6w6dwd8lyy9dFeDUzX/3k3Yqa8oS+rHMmWfPRpHe9w2Gj
 /jpyjdoWWeRytgvGvWQDNqyojAmJZl4gITzou2UeEPi9tjS3u/58x1XEciZNT0w5HlzR
 UDm00jdWjWV3Wc1dCXGo9dy44VfbV/FapzpGWvOwx9utMOWZz9FVV7tS8HyjADOkuUDx
 iHm1U0aX7Aw/AXSP5CfvZFFE9RKFoabJzbk/8wBx5H8HZgwf5lMeddmO+zGfmjR5+Vyo
 Vg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698758913; x=1699363713;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vkk8ZCgsYoi/AnkxKAKmjXFYbNerVSNaR8gjvx3gGLI=;
 b=qyOPE643BdTNVy0SU6uxt23rfaniXEKNH418ORIa+3fH7ygxVGE5TsIpq0SYgGx/xr
 FYERAN3FY+uhMIFe5AjkXu0h1QrVUeDCRKVXkNpVeaZEz0AANSYuLG57g4c1q3nZmrvZ
 15PEGE4Goes6x2DOqyrQeg2PDZIPD7LCbjF82SxhnIsMzFrq7GaxqOw0H9tt1lF27CdW
 XNoajDChriVz1wSebv6G2S5InTR3I07zFVKWUeczTu1Rrv7rlGUQ0nB4CEoXyMpx8H4V
 njJ3+o4lzr8s1/YqEUqv8AtWm5vHayoYkhlwZOSvknFAISH61LWZhSDHr9WoT1aWgfuE
 nAVg==
X-Gm-Message-State: AOJu0Yxf22au3E4v3KiPmCk2puIJQewRQnzpTr/5EgbCilzkTJduVjrb
 BvMSHvEAjGfJIQiW2npubchY146P2yCBcX4KJVozDg==
X-Google-Smtp-Source: AGHT+IFxGRQfCveVDXVJVYYAtbgwY6/eAygWWpBIQ5S0HJJ6v7iBgo2Jge7ptyq+gUT1DXQGHLc/CMOxuUr+u443Pmg=
X-Received: by 2002:a25:c541:0:b0:d9a:5ff4:cfde with SMTP id
 v62-20020a25c541000000b00d9a5ff4cfdemr11842307ybe.13.1698758913054; Tue, 31
 Oct 2023 06:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-8-dmitry.baryshkov@linaro.org>
 <ca3a0d84-befc-4426-8cdb-ea9d55e7fac9@linaro.org>
In-Reply-To: <ca3a0d84-befc-4426-8cdb-ea9d55e7fac9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 Oct 2023 15:28:21 +0200
Message-ID: <CAA8EJpqbMT3+53NndkjvJ67KvURYsbwD6yfT4v6KowsiYdOR8g@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 07/15] phy: qualcomm: add MSM8x60 HDMI
 PHY support
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 31 Oct 2023 at 13:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 28.09.2023 13:16, Dmitry Baryshkov wrote:
> > Add support for HDMI PHY on Qualcomm MSM8x60 / APQ8060 platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Do you have the PLL working locally? Would it make sense to ship them both?

I do not have APQ8060 / MSM8x60 platforms, so I can either c&p the
existing code or I can drop it completely.

If anybody is willing to donate and/or lend APQ8060 or
MSM8260/MSM8660, we can probably fix that.
Requirements:
 - HDMI output
 - UART available
 - fastboot or network support in the bootloader

-- 
With best wishes
Dmitry
