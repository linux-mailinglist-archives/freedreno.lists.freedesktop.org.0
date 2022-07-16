Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D5576FB2
	for <lists+freedreno@lfdr.de>; Sat, 16 Jul 2022 17:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583928EBD0;
	Sat, 16 Jul 2022 15:19:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184F791DCB
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 15:19:14 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so12798587fac.13
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2BfUBNX0n4f7Y1GuZE8KebgbvnSP7yeh/EvnDRpvCc4=;
 b=RXKq1U3siS6bIgkdCSzjsN7UFRZ8y9IuH/qUYCmif+bguUzUPRlkwoDtalAZ0YR/we
 ocOZdeJiTuy8IgBaKAdDAIOiOZPwZng0KKhWpT9yIf6/HsCmVElEvLC6DwWHmfIRp235
 1Rc2yZA+0tpZBSIhBstSWIvT/cJdVbmhG6CGhQ5Q6LeWW1l6AMk/Ov+Sra+C54HHX38+
 x+SXGDt3GhfjMoYbGHMwd8g6t4D3OtJY272ADjHpu4e3np3/3lWbO+J8IczCXdf7RrBq
 3HFAZzSegS6UW9vQWKxQMARJ0+HEupvW/YEZ3TMp+FhsZiVLPiFuGYb264rzncEXQ/fS
 HgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2BfUBNX0n4f7Y1GuZE8KebgbvnSP7yeh/EvnDRpvCc4=;
 b=Zyp+n1nWPWQb6Sg4l0y9Xa5A70rq1woet9mHBUO6FTllYE+X0wGtsuPbHZaJgucHhY
 QystOjk4V5wJPCrv8ZPgyNwXKxpnNddgwiA/4J1Wip0fGwkzEfSIsc+HhGqH7jyEvBWn
 WRpNyLt3mzxnNQA74HZLf4tvz2AdozXTB+4yGWowJDbbXv/nH1vfOecwwf7rV29SY7YV
 XkXLOD6CWrblJwguUp6awb1vAgqJ1MUXulISn+mt8ndb0qLdJbLGE3KS973IjM7e7YEN
 DOxqAaEZ+GzvAo3Dp4F8cF5MEXhZaWTb9CVX+x14tw6YIZvtHCmTC6uyjGYaako8PIjP
 7Ffw==
X-Gm-Message-State: AJIora8w7MjSxLrNZ2OG5WoRJfDZCzfXr831Y0FGkF3D200sTPVRaWCo
 mwgQrM0IAFAV8cqE/PJL2U/9Bg==
X-Google-Smtp-Source: AGRyM1u/D2i6YeZOgWbUezAgdhP7f+kntmr2LOIxra9vYBNzRoQL4ThNgjAlIhOQFnQ5V7g7bkxwzg==
X-Received: by 2002:a05:6870:468c:b0:10c:2a38:dc53 with SMTP id
 a12-20020a056870468c00b0010c2a38dc53mr10485811oap.258.1657984753383; 
 Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:19:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Date: Sat, 16 Jul 2022 10:18:56 -0500
Message-Id: <165798474063.1679948.3345784411436929832.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH v2 0/9] dt-bindings: msm/dp:
 cleanup Qualcomm DP and eDP bidndings
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 11:41:24 +0300, Dmitry Baryshkov wrote:
> Fix several issues with the DP and eDP bindings on the Qualcomm
> platforms. While we are at it, fix several small issues with platform
> files declaring these controllers.
> 
> Changes since v1:
>  - Reordered patches to cleanup dts first, to remove warnings from DP
>    schema
>  - Split DP register blocks in sc7180.dtsi and sc7280.dtsi
>  - Cleaned up the p1 register block handling: marked it as required for DP
>    and absent for eDP controllers
>  - Dropped unused xo and ref clocks from sc7280-edp node, they belong to
>    eDP PHY.
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: qcom: sc7180: split register block for DP controller
      commit: b7b17c6bf3d18d12f198a5ab6ae2f093545de643
[2/9] arm64: dts: qcom: sc7180: drop #clock-cells from displayport-controller
      commit: ae0f7e1d97cb047ab5aeb03c8987671a2da93030
[3/9] arm64: dts: qcom: sc7280: split register block for DP controller
      commit: 3c14a456ee3e94d58682f6c7c77f8e71cbbcd8d8
[4/9] arm64: dts: qcom: sc7280: drop #clock-cells from displayport-controller
      commit: 0f1e23651a0ab71c82ab098ecbfc9ee7a4d74ced
[5/9] arm64: dts: qcom: sc7280: drop address/size-cells from eDP node
      commit: 97e5c82d4e170b815fe31fb91d6639be0f1b11aa
[6/9] arm64: dts: qcom: sc7280: drop unused clocks from eDP node
      commit: f32894b8d8b4300693f1c3549cad544799ffeb3b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
