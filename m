Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629DD4A4E04
	for <lists+freedreno@lfdr.de>; Mon, 31 Jan 2022 19:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A29F10E2C8;
	Mon, 31 Jan 2022 18:24:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9594710E325
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 18:24:40 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id m9so28279953oia.12
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9mPaFEJk4glaPEfbstkf6mGQAvnXTOz75yKFh769Xs=;
 b=JDl52j304GonUugjmEz7Oj8bVrx7wZrIhVuZL8MQTQFuL/8MFLOWZcd/OaTmOicGVM
 824qZZU1lzNgpSPyKP8OVtZyrtC6NXu4WzFAm4zX/p4zjsWKbGKCmlzQZZmt5THva4bj
 Siy/ZQyep4uJp7mMKwtyshkyo761rcOBDf0JYn3bGDmLmlllLNpAFdUlJN6bzrcRzsAu
 OcLwjwA7iY8UYptOVr/wqI+Z8ixONiaFXDa4jkPOnn1KTdy8JG8bZ8Qea4rIVO6oPCIl
 MUNHoHOW+cjY2YzosAlC/gpuT2/ut7qLxpQIQWg5UeEG9jRiuQuKwV8ZdHYQmsBPx5gu
 Y9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9mPaFEJk4glaPEfbstkf6mGQAvnXTOz75yKFh769Xs=;
 b=lAHS1l1C3CDIr+EUq+9+LqL1bsakYc1IDyUdUmrfoB+o1W7g3ut0kQ2iqXmrbwvoBQ
 fmaBA9D9wLA7BxM6SMzXdWvGDCy/4TavZkrkp8ZrDayEi+3/cCPd0kNU5WWsyC/bjkeB
 qMFBKiX3WghOa+b/hnYGUDAM0v84I5M3DV9PJ8xwY9auj6AP6Zt3hzntOSqn2R3S8qpC
 ZD4aJbm8wi4eG7pap2KbUUGdYjPncGbpSlo5Ebr7XRdJ1D76FUMdp+de+nxCf/oLLl+s
 x156UIGAc+FHgdxAFXZU0PlW+/9bucHtMxEBhpINdIwS2ctVUiUUPoQXZIJ3ygqClF7s
 8KfA==
X-Gm-Message-State: AOAM531/HT4r4k78JyeQf4nrzC2GnG1T+Jgwnu06+rjCTGDmXVoi1yum
 8BOB+z9nXldGTXQU9VAbAHaUWA==
X-Google-Smtp-Source: ABdhPJzRbaJTu1CP/oi40yx3UKog6K9CaXVPNvF0Yk99zoOH4j6nXYBHdOpoDVHpkUDPo4bBKQ8nsA==
X-Received: by 2002:a05:6808:bca:: with SMTP id
 o10mr9686870oik.58.1643653479922; 
 Mon, 31 Jan 2022 10:24:39 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id y19sm3273722oti.49.2022.01.31.10.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:24:39 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 agross@kernel.org, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 31 Jan 2022 12:24:27 -0600
Message-Id: <164365345128.3009281.17096332459054539007.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1640361793-26486-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v5 0/4] arm: dts: qcom: sc7280: Add display
 DT nodes for sc7280
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 swboyd@chromium.org, robdclark@gmail.com, quic_mkrishn@quicinc.com,
 seanpaul@chromium.org, quic_khsieh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 24 Dec 2021 21:33:09 +0530, Sankeerth Billakanti wrote:
> Add display devicetree support for sc7280 platform.
> 
> Krishna Manikandan (1):
>   arm64: dts: qcom: sc7280: add display dt nodes
> 
> Kuogee Hsieh (1):
>   arm64: dts: qcom: sc7280: Add Display Port node
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sc7280: add display dt nodes
      commit: fcb68dfda5cbd816d27ac50c287833848874f61c
[2/4] arm64: dts: qcom: sc7280: Add DSI display nodes
      commit: 43137272f0bc5e05e4c4c6f7bfce017bfb9e16b5
[3/4] arm64: dts: qcom: sc7280: add edp display dt nodes
      commit: 25940788d170251373d8975d359706350818fa0f
[4/4] arm64: dts: qcom: sc7280: Add Display Port node
      commit: fc6b1225d20de0298a7b0e52eb3843d71e1992e8

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
