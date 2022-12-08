Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30406647A55
	for <lists+freedreno@lfdr.de>; Fri,  9 Dec 2022 00:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EF110E1FE;
	Thu,  8 Dec 2022 23:47:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5E110E1FE
 for <freedreno@lists.freedesktop.org>; Thu,  8 Dec 2022 23:47:54 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3f15a6f72d0so33004637b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Dec 2022 15:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nKV6BT6LEw5+/sJcf0i0xfNz3b5Jl8HAfbTDKPVt8Vw=;
 b=VZPX0cvTBVVGGwtx4GT5F80JCgxOkH+f87BOJ+ZLvw4+FASwy5Jevkv3jxFtS24CTr
 7EOmoqAEmxhSdrFH54sTdwuYaLF8GC90mMIOv+WdwXKI3nif4JGFq3MmUeEkMZLr2HCp
 NwUSRTz8OkShpdsrbAZcCAVypQLDquNJZbETLv3hT2iAefubao/lEJqmXaKR5JCrS+X8
 a6EuY1TKZnxrEDADa+DLnGxSYiR6p2zEfgTS88G8CXIMilXSFNTK7H6MID+vZ2H8kID2
 Ttj9//d6z3hbpT95cK0Pz1B+NuRbXS2QkJGI4RoVsAuygMwo4VgxhBWPPBGUQJ3fgcXn
 mFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nKV6BT6LEw5+/sJcf0i0xfNz3b5Jl8HAfbTDKPVt8Vw=;
 b=hQY6WO1DCLCAecZXii4klXfpI/cq4rJ37VuHbD3p80nZ5IA4zkE2fzMZNUfFjcnwO8
 2i6gb9aVDos1afIwJnA+UQSoeK+xrWsSCgizKhXkrYwEP+JrPdQdoCqXz6WdQ60Oj/3O
 O9iqbU8k8MJjW+DL+WDCyYeHZF/plji1f7WHT/6DGSBKT3erXThLH/FuuAKV9clyU4Kt
 SJ8DkPRNAeU5+CEyl1cs8CDntlmegJKyth4dwKMvoK0tC0yF22C304a3p+oZLIcCfFrO
 NcYklgTdRoQmWykDBIF1aBk3XTJv+zUlGRmbsIcm03cB7NgUYGKjYBA8FEM3WXJcV+4q
 1LNQ==
X-Gm-Message-State: ANoB5pncBBrfLmeDbRvOtErZro2ONWDdbIuC83RUlXQqrjJM640rYYqP
 dL7Rm6mSdtHtmmMx2D7whu2zxpYq/BLNV7CQkhQt4A==
X-Google-Smtp-Source: AA0mqf6nKXdmqB7cAUt+vD3PhoN3eOlGWsTR4vgctHBKq07KXpsU91IQFVITL+i9eN10ZoLyicieXaZaj4sh1tbG05Q=
X-Received: by 2002:a81:6704:0:b0:3d2:61bc:e6a with SMTP id
 b4-20020a816704000000b003d261bc0e6amr39962281ywc.132.1670543273423; Thu, 08
 Dec 2022 15:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Dec 2022 01:47:41 +0200
Message-ID: <CAA8EJprEq6F3T7iz-oMiagosR+rdPo8Z05vgz9jNjaq2uFv4MQ@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require
 vcca-supply on 14nm PHY
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 patches@linaro.org, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, David Airlie <airlied@gmail.com>,
 Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 15:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 -
>  1 file changed, 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
