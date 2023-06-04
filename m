Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39624721441
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 05:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE83A10E100;
	Sun,  4 Jun 2023 03:01:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA00F10E0E8
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:46 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4e71a09a7so4474343e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847705; x=1688439705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cvt9G4J1O7RH3aFrrj/0ASjX+P7Libu13qWrQpH+1W0=;
 b=jwdNqVOfCMQGFGzIo6Fy5QfIGbKN9WEsl0CvXsOM7pH9ZAMtDUm+ituEFIsXd2kNpQ
 9kPkqZPOAEdijexsiPcy+MT3717tgrvgaSZHmA3N19UN43hjCQwhuAyy+wJ6hDAwumCS
 oqDnMhdM3G5aa7qa80K5KCx76KLR4JYEN/Mc3/p82LASs4M4gYYSd3pZnwH8frQHRGfJ
 eN3j8eAwrtOiRBlaag5IfKpGVCApZWRDyERY4g5l40WG0VTKiGng/+PVRdL84z8IVP7X
 hnSChs3htNWrlbyycexFJHcUfkwnPv7SfmxpefgEnSgSXA4a3NNqrBUTqvqJfwNOaAmZ
 UzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847705; x=1688439705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cvt9G4J1O7RH3aFrrj/0ASjX+P7Libu13qWrQpH+1W0=;
 b=ZtazycZ6kPX7q6Ozso8liz6p6jRf6f9ct1xaHrGYPmMlIoFt4NbFUv7grD0R1wFIw1
 yrhdzgxaXLKvNCYBw6L7QvjsjqleKUcat32cs39gb0oEh0XxyUfK5hfv0Yd225wAC7Qe
 I4iMO3jtzNYAgVisHSMZ+q8KDoARxLwRLv9an8psN3rQke6zLGT1Ii0RqlOrKMSlT2SL
 GEFrMFhffNEHoFeJyRilv3ev0mrk+rLnwymoGmqJ1yalkz/T8bbzfBWAvoeLjYtI+LCa
 S6tvAUOW8QqoMHX7fwHL43AUcwApLMYGpzrdq0o6qBE6fnD3aMLdMs8aEXM9P/mjoLd9
 To0Q==
X-Gm-Message-State: AC+VfDwYIy6ImXsBfNEZ0wMajZKdMbji4hVDibYfu6FQKAZbDke7RRXh
 j2PxJyZTkiCscKXXDolTs1Nf9Q==
X-Google-Smtp-Source: ACHHUZ4sQcWfNKUlG0DqZ/vYCqit1XPzQoNH6htAfSRlcYilAK2WeoGTVLW4LeyBjez3ROjkfj7idg==
X-Received: by 2002:a19:7014:0:b0:4eb:e8e:4139 with SMTP id
 h20-20020a197014000000b004eb0e8e4139mr2202168lfc.2.1685847705229; 
 Sat, 03 Jun 2023 20:01:45 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Luca Weiss <luca@z3ntu.xyz>
Date: Sun,  4 Jun 2023 06:01:33 +0300
Message-Id: <168584750427.890410.10501565225418024189.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 0/7] Display support for MSM8226
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
 Conor Dooley <conor.dooley@microchip.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 01 Jun 2023 19:00:07 +0200, Luca Weiss wrote:
> This series adds the required configs for MDP5 and DSI blocks that are
> needed for MDSS on MSM8226. Finally we can add the new nodes into the
> dts.
> 
> Tested on apq8026-lg-lenok and msm8926-htc-memul.
> 
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: msm: dsi-phy-28nm: Document msm8226 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d01eb3421b10
[2/7] dt-bindings: display/msm: dsi-controller-main: Add msm8226 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/46ccf3e0ed63
[3/7] dt-bindings: display/msm: qcom,mdp5: Add msm8226 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c6e79fd5c80d
[4/7] drm/msm/mdp5: Add MDP5 configuration for MSM8226
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eed3f9c7c36a
[5/7] drm/msm/dsi: Add configuration for MSM8226
      https://gitlab.freedesktop.org/lumag/msm/-/commit/82cf4954a0d5
[6/7] drm/msm/dsi: Add phy configuration for MSM8226
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1531d0b9235e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
