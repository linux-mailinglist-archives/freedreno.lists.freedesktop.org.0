Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6075E5CA9
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 09:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756BE10E1B4;
	Thu, 22 Sep 2022 07:50:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A3510EA65
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 07:50:55 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id e187so11546177ybh.10
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 00:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Sds/Dyb9ikOJ5Khfgi4mahargaDHP26IO9csDUpISkI=;
 b=AL32irr9FYBKUHIMMo9eydEHfgQBuJXAF1H89Pdx7WfEOgLxDFof1d2iloaxmHz3MU
 7A6q3mQUUPlbgcPO1mv30xD6Jh46/G3ZSbLL9NzwwHNOmyDfps3O0ZS5hNnQHVsGEjqw
 kXXFtzjE6X/0uMrKBwPoj9qBj1e6naSv66VFWpxMUPKtV8A8owNf7h3nT5KRtiJqtjz+
 GicpVKAZCIBSVdcU/cNIZ7FW/Si2ErxCcRy15qVAjuTmExkgv/eU+gkTLgcWwLd4u0GQ
 nU8nLPhL81yotdmJHno45uTGy12/qx7v/7BFzCS7mnB6kltpVmz7iQx9Y2+oc7L3Lsai
 WRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Sds/Dyb9ikOJ5Khfgi4mahargaDHP26IO9csDUpISkI=;
 b=WhXj0VOS+6s2nB2Xtpx2bm6wOt96rqGKt/ZyPY2+TEG1ENBBX/lWgBP9pgaOYzhee9
 V4xop+ueocbz9idcOt5M+Fk5deFWb3Mn/1f17HS1IYqrSnnZYIHy0LX60+DHJ5A38dtA
 mspe0o6gXnj5WU/5MG9Te/7DHZsFFhyGEvcp8DT1AQDVLA1NVH4zV7d8wrG6Wrv2Hn31
 9pzmEnKT1nu4dGIaDdzyxlgPZK2Tr0IWx+PPlpqTpD6iW8fyCSMjHzNa2u+kkwGXMdk4
 slpIA0XsuRHpnyzIMz+vyTnsGw+jSpuo/GDouxU7V5c8avVnp7Zy8AroVsxOI1bxaMoW
 QEEA==
X-Gm-Message-State: ACrzQf0HjZqhQPe1yWqOAjfcBOBFGrkX6zvzsnjvX0k0J7Ae5gZL270s
 essSywruM9p7b9VN5NDtCOVyHr6uTFYOj9WZJ1CP+g==
X-Google-Smtp-Source: AMsMyM4crSAFL+O0e+s4NTT408WVmhHJaTlutWu7sbiOJhejjg0f2UMZVY1/RmXcx4UZDj4v7SZabrQOYZMdyXO+xKs=
X-Received: by 2002:a25:81cf:0:b0:6a9:4d0d:5ee6 with SMTP id
 n15-20020a2581cf000000b006a94d0d5ee6mr2392450ybm.153.1663833054098; Thu, 22
 Sep 2022 00:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
 <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
In-Reply-To: <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Sep 2022 10:50:43 +0300
Message-ID: <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 04/12] dt-bindings: display/msm: move
 common DPU properties to dpu-common.yaml
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 22 Sept 2022 at 10:02, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> > Move properties common to all DPU DT nodes to the dpu-common.yaml.
> >
> > Note, this removes description of individual DPU port@ nodes. However
> > such definitions add no additional value. The reg values do not
> > correspond to hardware INTF indices. The driver discovers and binds
> > these ports not paying any care for the order of these items. Thus just
> > leave the reference to graph.yaml#/properties/ports and the description.
>
> This is okay, but you loose required:ports@[01].

This is fine for me. The ports do not have 1:1 correspondence to
intfs. Usually platforms add ports as new sinks are added. For example
a platform can start with a single DSI node and later get second DSI,
DP, eDP, etc. as they are receiving support/required by end-user
devices.

-- 
With best wishes
Dmitry
