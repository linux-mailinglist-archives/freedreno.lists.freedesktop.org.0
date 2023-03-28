Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE96CCD7C
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ADB10EA1B;
	Tue, 28 Mar 2023 22:38:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4279B10E9F9
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:12 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id x20so14160955ljq.9
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2giLkDrmf+/kS5P0IwHTfvbcUznWvWbpf5OjTRcuNpk=;
 b=a29iHMs3Hnbhc3OZ1JQZ+nRgd5NjHoBwJRWvVpY1DiAF3FeY4VWiTBsgqlR8u89HHq
 HsM6jLxvXIKiFiTq+tdJnbRNwlMOm0TFLsqsWRYbbGOLRfZU/lrh9dXLC/mmtTCzR/vy
 arzHUUDiyJcwSc0ta9gGOvzY+cmTyPwev50+t+DQR8y3n64veGb8kafgnphj3zu3wGwW
 bQhh2midZaE9FeYHQel0dBWaZU6QSmZwnD2O0kgxYurO8lrYuua7vbpv2BfEube5IFlN
 OTK+xB+Z/4ZZtCCysoB04Egz2zz9SFZABNADu8pvwweUjCDJ8lFk00GmkPsWm9shrNio
 dmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2giLkDrmf+/kS5P0IwHTfvbcUznWvWbpf5OjTRcuNpk=;
 b=GgcSnFfiHC0trTZ4Hn9GxUh/4fNd2yThPmBXjmn+VGzdaVHwaKIYt9pso+JNe05Mxw
 pVNL2acCV1MZ6YRzpv/DFe3iTbYLuxqM3OXvddqkmgKeYjAkPNKq/Tj0MAY5hBGjflsU
 se6rHN4MU0mjyaeNM+yLuXlsWxKgbJigVd0F1q8d5TDsjHRe26I2PNzfnffVrNnbdMNf
 5uWhJNOsVi5riPNMBkR85rOk6QOUn3rSEWsMUHl1r9QCDZt1Oq0hS57x0h93y6FjPmGt
 QTc1qkyKJ9QKxt/zYNYa1vCd/wyS5yBn3F1767heCMF7LLJQUSpTDSDHBZqINg1T1yg8
 QkNA==
X-Gm-Message-State: AAQBX9dGlai0WJCXiuCqGynNBb0DteEYEzJU4vGPhSUgOwjVBJHlKnuZ
 ln5OZpDqyCpRpYWVr42VB0j7lg==
X-Google-Smtp-Source: AKy350ZuT+dg/CToqXJq0PLw9mvrnrKKusC4KJ2+fUBG12SiPygnK8UFv3lgFjNzEBx+vxp7CVFxGg==
X-Received: by 2002:a2e:3e18:0:b0:2a2:41cc:fb1 with SMTP id
 l24-20020a2e3e18000000b002a241cc0fb1mr74651lja.12.1680043091825; 
 Tue, 28 Mar 2023 15:38:11 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 29 Mar 2023 01:37:57 +0300
Message-Id: <168004255465.1060915.7804485364271836960.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v6 0/5] arm64: dts: qcom: add DP Controller
 to SM8350 & SM8450 DTS
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 17 Mar 2023 16:06:31 +0100, Neil Armstrong wrote:
> Switch the QMP PHY to the newly documented USB3/DP Combo PHY
> bindings at [1] and add the DP controller nodes.
> 
> The DP output is shared with the USB3 SuperSpeed lanes and is
> usually connected to an USB-C port which Altmode is controlled
> by the PMIC Glink infrastructure in discution at [1] & [2].
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: display: msm: dp-controller: document SM8450 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8554420f1912

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
