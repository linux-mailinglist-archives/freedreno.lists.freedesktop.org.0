Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696DF6710C4
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DA510E64C;
	Wed, 18 Jan 2023 02:06:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE18210E634
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u19so79775742ejm.8
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzS/zvWe4dE4qAlzyHEWNojqR1ZH/s6LTLUTq8cJCDs=;
 b=x1UIMFzhhzmPp33rMJL9P9/UdyqBh0ezz8HdRiZ+FCVBLR2OShryDc+uG9Xvznt0vB
 5cCrPmQCV0teL8HGC5L/s4RV3HC8ChldGjXbGsiZwjPVrQe2smTtDRRf7iqYqqn86TTk
 LVQbZrb/+9Zbg3bHkzZp0HPycouflZYRFZ5BApQc5fCqveUceFQQI8X4Q9TodF6H0E+L
 PsV3n7mIYFa0vm7jF+alaBDlUtsWJcHIWlCpZuUQsUxXdr+eF8htRbeQoPbKWKoaWv1C
 w3P3jvnRQvUG7MFjeFymVS6p0OJBFlCKHbVNzYuTwjmpB+1q1Q1MGH55JGmDjYtJbDaG
 2bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzS/zvWe4dE4qAlzyHEWNojqR1ZH/s6LTLUTq8cJCDs=;
 b=Ujjj9sgs1w67mwK2lIk76PD+CgUeAmrOpekOpOt72NEmkoCtHC4ePPmJ6+tSuexjf3
 SA6b7VmbFGs77OKxiibnC2ZtURHQuSgPx/vluIyUpfBCi/tUbaUYZBKvU/j9CQcHxsoX
 WEfVw1Uo3rRKq6ZW3KzIP8186xHafdMjp5WeTR2VSLt0r6OXWc4cs0xdFNkANYEquU13
 okg+fwyBDOSX4dVK4qwoBAKadAkQsUNAcmXym7icuKT99wZcR2RTKn10AJMNGQG6kW5u
 g/YsQtKI1KY/rVJUbWr4GNi59FhJsnxj75ytaEdFDEApaFPrORTjcS239qObCaTQVpV7
 cPxA==
X-Gm-Message-State: AFqh2kq7FE/ADUxPeBXvAyf47zDF4Qm8NGo+Jj7hbXiH/1eznpIUg01S
 V1ST6jFhdz4aHvpiJTwXdZI9Ug==
X-Google-Smtp-Source: AMrXdXtPspMwAZbGwbr77eEM5eDgiYrt4RPaQoYwIAtRNNe3VLezx4/sosP5jnJFOjMOoW2VPQl9oQ==
X-Received: by 2002:a17:906:ca59:b0:870:7e7d:97a3 with SMTP id
 jx25-20020a170906ca5900b008707e7d97a3mr4427567ejb.59.1674007589171; 
 Tue, 17 Jan 2023 18:06:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Jan 2023 04:06:11 +0200
Message-Id: <167400670545.1683873.1367688768865327080.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
References: <20230109045453.316089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm: qcom,
 mdss: fix HDMI PHY node names
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 06:54:53 +0200, Dmitry Baryshkov wrote:
> On Qualcomm devices HDMI PHY node names were changed from hdmi-phy to
> phy. Follow this change.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,mdss: fix HDMI PHY node names
      https://gitlab.freedesktop.org/lumag/msm/-/commit/759cc4914fb0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
