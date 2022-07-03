Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7191565AC8
	for <lists+freedreno@lfdr.de>; Mon,  4 Jul 2022 18:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E5210E678;
	Mon,  4 Jul 2022 16:14:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F42410E06A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Jul 2022 03:57:12 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-10be0d7476aso1955209fac.2
 for <freedreno@lists.freedesktop.org>; Sat, 02 Jul 2022 20:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UR/oI/Q76VxA6HU7lRgndk3Cfr5LCInpXcddK6lqF5s=;
 b=lQv1BdJni9Px/WEEhsnaFpO5GuaonU55zc14yKU+LSh+octtrDzM1XiRp1pREg7zpd
 fZUNGjJu2ArjO1UeuXLMvUC+N3x2fFvS3oYa0UWpXv/tHHWIhxlGaXIh4jgYquQ5VQ18
 0ysDWH5JXOzKCi6yu80CtbJvfD0YTmgnVcqePfeqDhQkASxogm9fPiPkHDLU/AQ9KIEE
 441A+lz8K+Mku+YxDfWHY1cUqU+75PQmD8SpR2+OqYu1Vq+R1WmyS1EHsicjWoRMj4p8
 bch0TbdRy/txwR2iIPoQJID/3ifmU9sePRuGGuEEufMJ9qm29K+r1/dUtM44T88Jwp1Z
 dtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UR/oI/Q76VxA6HU7lRgndk3Cfr5LCInpXcddK6lqF5s=;
 b=DRzxj0zeBtOeseJ9CNTkhMo6tbVhvln88CAAlQRPdvL/lFs4xKlV7f/akwgWgzmU+1
 coX5Q2tUkHB6Xr7Rcibj63vPkJNVzzvyq6tuM2jOMvzTEY59Nh+6EsNM22NOCDlHE0Vo
 cjBM9CAMGOCX+ZDV/jD89pXhZpN/o872oIzPtmY0kyFsZCbZlJ1FqzH8x+Ot1V+AifZZ
 NPMKfhHAAWHhGpUkRYxPIs4w1m5ziVv5jfjVrz+Lsb+mdKEXjbnjDS3TbWSW4/pSvFjY
 JrrUuO11Mm+oU+TQN6jSW4FjfcGfENhBL0sKY8x7x7P5EbX6LiZi/M+y8ZEod6ZvHXvn
 LOMw==
X-Gm-Message-State: AJIora96a2MIuKB9WVf3mspjIA/+lh8tm7SasNxfa5d5tu9uj5ob7FUK
 leichr8u9pkthPOSK9eHFpOV1A==
X-Google-Smtp-Source: AGRyM1sKOIgfdKvYKJgJH7p7gU/hFoji4Z+mz/VwOJMgNWtzLtip0KO3QlhQZJkrJbW4hY+m0QEDEA==
X-Received: by 2002:a05:6870:6a8a:b0:106:a8fe:c621 with SMTP id
 mv10-20020a0568706a8a00b00106a8fec621mr14301860oab.163.1656820631293; 
 Sat, 02 Jul 2022 20:57:11 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 20:57:10 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Date: Sat,  2 Jul 2022 22:56:07 -0500
Message-Id: <165682055971.445910.4131004773759034075.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH v3 14/14] arm64: dts: qcom:
 msm8996: drop phy-names from HDMI device node
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 9 Jun 2022 15:23:50 +0300, Dmitry Baryshkov wrote:
> The HDMI driver doesn't use the phy-names to identify the PHY. Different
> Qualcomm platforms have used different names for the PHY. So, we are
> deprecating phy-names propertty of the HDMI device and dropping them
> from existing DTs.
> 
> 

Applied, thanks!

[14/14] arm64: dts: qcom: msm8996: drop phy-names from HDMI device node
        commit: 917a6de1b0a0d55c67533c5d3827ddd4388b14a5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
