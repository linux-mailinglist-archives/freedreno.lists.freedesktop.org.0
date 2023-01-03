Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB2865BD17
	for <lists+freedreno@lfdr.de>; Tue,  3 Jan 2023 10:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E2210E3BD;
	Tue,  3 Jan 2023 09:24:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1595610E3BE
 for <freedreno@lists.freedesktop.org>; Tue,  3 Jan 2023 09:24:31 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-14fb3809eaeso30179739fac.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Jan 2023 01:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mzcK4BlDrehna2Cf5WyLld2E+p/c7PCOy1ZvlyaJP1k=;
 b=bR1gztSKPi5u6/qmjSq8JJxxv3wfyJmMLpirn/KjmYibxhjZo7U5fODxttptFG4MZ4
 0IXObSQFL1xNHqEy9yAzbxhEb+FU5HZHEK34C6Ofn5xjvKJTxUVdiTMnzTXI5lLY6jmn
 uqPKflfmFLiTiOLvpmlbSeXcHUMzp4BHwLzZ+gx+mL/n09kl/h3U90Lxgu9xZyERDy+X
 pN+aGzLOCuL5GZJI2FeIyy8y1r7QTz61jIjmrPeSChzLCOCVEiunaEiVXRndm9YbAak0
 tpw42Yi+0S4wXmyg/of7mbrSehHDNbYtLyhTXH05Yrk8uYo3xyuziGAMU9T+Hc9Ke44Z
 F8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mzcK4BlDrehna2Cf5WyLld2E+p/c7PCOy1ZvlyaJP1k=;
 b=TzHMmIs5jvk+KDwA6FjaxkcDvhmqyyOVlgPO8FTT7Mt80iHTLMqIUrIieJxpxs/8s6
 C7lp+v42nJxqmak9lxBdZ7XSqGYCDLPF+09tkEglqjqy8vvsXNBOuqnrP2Sft/IHZVKb
 HLGcrGzPhxEeX8n5dSmOn1ZII3hwOwDHbpIDFPzF6bB+TkYK8jvQaEiEHDYjFtwGzepZ
 oaB9K+ywqMC8/ROUMh8BU23Y2/tXiIY8yx/pej9tzgxZk5uiRzKJ41IGs8kJiBewmSaA
 to0qED6e47FsYTvDBI8+iyEYwfS6vRw/VOXZX4wOfpi5lLMaRm90sNHVGNFqEtokTj70
 5cMQ==
X-Gm-Message-State: AFqh2kq9Hw4LAfrYx2WX/DfBrSiyWcBZbqpZgmPJLcDzZq78rdb6PTTi
 oRwFMDoXbeS3sKfnVDIJczwMTfR/MRgrUfhsbB0V6Q==
X-Google-Smtp-Source: AMrXdXu7+GEt205lhs8PRbBO9C5QHjATHLZxARTl42LbFtqkt0s4GGajjKBhO17x3s7QodHXVkcp8SHp01rNiJX+xZo=
X-Received: by 2002:a05:6870:fb90:b0:150:22dd:1f54 with SMTP id
 kv16-20020a056870fb9000b0015022dd1f54mr1713164oab.155.1672737870170; Tue, 03
 Jan 2023 01:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
 <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
 <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
 <b8a0d9c5-eb26-c41c-1190-2628977bc582@linaro.org>
In-Reply-To: <b8a0d9c5-eb26-c41c-1190-2628977bc582@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 3 Jan 2023 10:24:19 +0100
Message-ID: <CAG3jFyuUV79nyjnqNysDKQSyYb4HUSWu-BvxG6LAz1Uavmvkbg@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2
 interconnect cells
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
Cc: konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liushixin2@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 quic_vpolimer@quicinc.com, airlied@gmail.com, vinod.koul@linaro.org,
 Jonathan Marek <jonathan@marek.ca>, robdclark@gmail.com,
 quic_khsieh@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, loic.poulain@linaro.org, andersson@kernel.org,
 dianders@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 vkoul@kernel.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 3 Jan 2023 at 08:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/01/2023 18:10, Robert Foss wrote:
> > On Fri, 30 Dec 2022 at 17:12, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 30/12/2022 16:35, Robert Foss wrote:
> >>> Use two interconnect cells in order to optionally
> >>> support a path tag.
> >>>
> >>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> >>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
> >>>  1 file changed, 14 insertions(+), 14 deletions(-)
> >>>
> >>
> >> I think you need to rebase to include:
> >> https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/
> >
> > Ah, I see. Functionally I seemed to do fine without those commits.
> >
> >>
> >> On which tree/revision did you base this?
> >
> > msm/drm-msm-display-for-6.2
>
> Then it is not a proper base for DTS changes - you will miss quite some
> commits. The DTS patches should be based on Bjorn's SoC tree or
> linux-next (although the latter sometimes can lead to conflicts).

Alright, then in that case this series needs to be split into 3 parts.

The dts fixes, remaining dts changes & the remainder of code.

Is this what you'd like to see?

>
>
> Best regards,
> Krzysztof
>
