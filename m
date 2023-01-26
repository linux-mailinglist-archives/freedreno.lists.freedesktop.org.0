Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6367D4D3
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1610E97C;
	Thu, 26 Jan 2023 19:01:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06E910E97C
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:11 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ss4so7623848ejb.11
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoTZ2Jk2oo1sJu0z9U4fY49QhdA4VbOjy5AeWub00mg=;
 b=zFCkTttsnqQaCwrfwAGBQ+ACq42jLXqAWnuY3wlE2cC4ZthG4+0G+HgJQQeQumj6uA
 9grSD+txpZ1qgxQrl4PoeyYbQO6FjTtbmqIkKCPQZGCu1+gfh7DhFVGQZPdJGYoZuZlY
 Y1ybkASLuGOK/ukJyFzJ2ODZXfomJFWKEQUo1tstN3N/ZXdKMllxHG3xhEm1K5pbBkO8
 idQ8LmnhVupZYF4X7bmAb0wnQI9Ew/sgMTXVBo6n/Y4UQTng0pPdLR9bDxFv1X8npW8A
 tJ7iTu9f/3sFqLIHdeqpnqiycVHkZg4oxaByZ6McSd5oeXHsuiYfw1yLm4A2Zj7PW7Ej
 O4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoTZ2Jk2oo1sJu0z9U4fY49QhdA4VbOjy5AeWub00mg=;
 b=n4XRbXtNcH38vIyWXa9GomPhu1IkmcJQbjknIuhCTmZX0ugQ1CuOX+s916CfOxDIZI
 QXwW6PiQAPMJqLJKGc0QTUCsl10K8v+EFMRi6ZHeFjJU9jbx86OfKr3VjIQTBcyqLZQZ
 GjZI/0gD/Uo2pXZGJH7Uh1JTAECYMdUsJNpEwVLffaUjFXvlkbrLOd2VNFrF0fcBOV6t
 4SQ4vpAqLz9LRdKxtRtCc8SwJus20w15eGk6KphNYBfNvdP1+Sa+AKhnbxWO7J12GBbM
 AUgwXinIbNx51WVtBkA8DD3HT1tyQeypgLHGfnCyT5RqVJ9q8gGDt4rgnsuua5HGhlaX
 oiqg==
X-Gm-Message-State: AO0yUKVeJ22pZIF72HL8ek99AI+YRXKn+NKnWtuERorkV0kfou79do5T
 mErDI3JF1S0L2S5dXbm3s8tVyYih7LN1gCEg
X-Google-Smtp-Source: AK7set8CoXdSqRs9pJYWdfzKjq27yB4L36ss7j8AdDvAqlKH7VBunIDH1x18EQGPeIozH4cWpvZp0Q==
X-Received: by 2002:a17:907:205a:b0:878:4e5a:18b8 with SMTP id
 pg26-20020a170907205a00b008784e5a18b8mr4548339ejb.66.1674759670455; 
 Thu, 26 Jan 2023 11:01:10 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:00:54 +0200
Message-Id: <167475959093.3954305.15907989272487832068.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/4] dt-bindings: display/msm: more
 dsi-controller fixes
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


On Wed, 18 Jan 2023 05:24:28 +0200, Dmitry Baryshkov wrote:
> A small set of patches to go on top of Bryan's changes to fix a small
> number of remaining issues.
> 
> Dependencies: [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230116225217.1056258-1-bryan.odonoghue@linaro.org/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm: dsi-controller-main: remove #address/#size-cells
      https://gitlab.freedesktop.org/lumag/msm/-/commit/65e835945aab
[2/4] dt-bindings: display/msm: dsi-controller-main: account for apq8064
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f8e5f8b2ea4
[3/4] dt-bindings: display/msm: dsi-controller-main: allow using fewer lanes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2fd5293df88d
[4/4] dt-binbings: display/msm: dsi-controller-main: add missing supplies
      https://gitlab.freedesktop.org/lumag/msm/-/commit/05c578d51624

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
