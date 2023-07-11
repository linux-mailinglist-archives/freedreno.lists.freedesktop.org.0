Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4045F74F1C9
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 16:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1A510E090;
	Tue, 11 Jul 2023 14:21:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C575010E090
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:21:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b734aea34aso1201941fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085316; x=1691677316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4OHhf//BH7yn6Q/Ot3BJTEK+Wcory0adfABT5r6wUE=;
 b=tyWb6Y5kdmHtSYc89DJi1+pl8lGEj05MyNn/Zv1MCiy8+izcQ+Vp8EUkoZ3o5QHUwA
 QErrdevOrnHl7ZVkvMXUf5eAJmT2FEEibUl/eWrQFeNZ5KhBM8sF6D7pkY6P8hiLEneC
 RXgxh2TOoi7msRqZWLV9/qhG+9WxnnjEehnGHMJ6AGiD5rTirRDezXqOaBLNrTCD+PQW
 QwHIRS1IncPuoOgatcUULna+4VK6MKjmstJl+hUQ13m5n/xq/u1V84O9WBN+ddOTjFVV
 U6Q0NOeB+I1oiAcI7+NKaB6fFMJ9Qdtnp4IuEu3LCMGqkKMu0JvVAku8l8gWrRwBwPoA
 PX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085316; x=1691677316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4OHhf//BH7yn6Q/Ot3BJTEK+Wcory0adfABT5r6wUE=;
 b=C0rumnhJ1KOD1lLhzuooHe3q1TDkB/VcH2GtS4AppHhz3WRH5I3rDZOplJnMTUcuEW
 C3MlxMhKj/Y1KqMSFNITYUO9tgsO5xNjl0isJMEG9s4rJXhOm5iBgEjjLfHPGNA3hnIy
 +TIzN4Es2A3HSYc8nb3bQXHEmsuAPDxf/UoP+GLFDe59eGR3/s5GZwcgg7TdOOeY1RLI
 UU8IaVufl/czCieUZ/TQot6hU1tZE+0RbcXMXqU4Zj+RbnGxTLPYb4Jg3Z+fg6Hf6OOJ
 YIwytEUiGkdWWqTWm+o+UTD3YNAWtOF3wZ0Ay2Dr+jmZO63a7lqieIcFp/l1mqqDiN5G
 2lEA==
X-Gm-Message-State: ABy/qLY7hfXDpnm82KJqMqw3vOxVKZjfahHJntZ2dl0X+1+364p8t3iz
 gEW8URPkyJzR+FrX0ftJHdtdug==
X-Google-Smtp-Source: APBJJlFAMhH5pIJfp4bCLgKjGyunfjO3nmFym3bFGd0v6tXuy2T+eDybgK8uyTe2IuT1NOb+EJ5WvA==
X-Received: by 2002:a2e:8887:0:b0:2b6:e719:324e with SMTP id
 k7-20020a2e8887000000b002b6e719324emr12798365lji.49.1689085315755; 
 Tue, 11 Jul 2023 07:21:55 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:21:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 11 Jul 2023 17:21:44 +0300
Message-Id: <168908465040.1869384.6896423598850742702.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable
 DP support
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


On Sun, 09 Jul 2023 07:19:21 +0300, Dmitry Baryshkov wrote:
> Implement DisplayPort support for the Qualcomm RB5 platform.
> 
> Note: while testing this, I had link training issues with several
> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> or VGA connectors) work perfectly.
> 
> Dependencies: [1]
> Soft-dependencies: [2], [3]
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: msm: dp-controller: document SM8250 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5ce85953cc45

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
