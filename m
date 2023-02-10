Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC2691CC0
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 11:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982AC10E05A;
	Fri, 10 Feb 2023 10:32:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0AE10E0C8
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 10:32:57 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-52ecd867d89so13710677b3.8
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 02:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T1MawgD5LNBGzOmeVRwqtAYkl3sDhmQa4D6GTdWIOGM=;
 b=DG9/ACm943ayV14N7GO9Kglp2CJZguAFiwBJtEWgbvAIM94k8oD0hn3M/RYo+kEnFd
 VaHGe4PzJD08j1j6Mnjcce0iDAMZ+Hlf88WWeChh1GiBcXcRLaWgzAdxwuNHD6rGEg7a
 ck+6iCh/rO5qW8xJBYlO1wgJOx1a6q4ofawz53BTDZ6w6SoiH/BowN5OO0LDKKpqXtys
 TjMhQccSGSwS+XDNuQIpBU+yu5XX9C7HTtb5QTSNxOX4uwCkA7Th+LcNqUJrpTym4deR
 PRkHOsy761yd0Z9oELZwsetJX5ua/1PtEjqp84DY/jJBUjBvj4fZNWFMUS4wVGwgicsC
 mtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T1MawgD5LNBGzOmeVRwqtAYkl3sDhmQa4D6GTdWIOGM=;
 b=oSo1DGPsYXh945G7iP8w0RQt1nE0UTpZbAjdcbB7Q1iuhk1NCqbWAJbaejMKFcQ5Pm
 ZoXugv+VgRezUSYlp2SOm94tq/tiJOhufi8PQfxNAUzYyssz5H19g/hMnUHCqZ8agr2I
 CiTGoq+JaNJJ8SPwHAcsfoATZlzMsEOK/IOFUsUDrjULESFCfO9B/qiRvHlMO+aHgtsL
 MUF8nVwNrqxtVyJ+Hnug1dJnUXCJdkD7aEpmoxMgmhbM3PgXyUScSOdbxjvTS0d9kxmq
 5tGi9R8+0LZWkY17jxuNe1P/POIp6OZwZidUKsmLO90HLcliELGOMwIS8TIO48VhcED8
 btPQ==
X-Gm-Message-State: AO0yUKW5HyfnN63Vqj5ACRl1e0pR8PO1NtpISbazL/kGhROp03ELnaNz
 dyPvzG0X5fzcnwR6xeUC5cvE7l2YZkpWWetX9y5RnA==
X-Google-Smtp-Source: AK7set+yHiwZIUkgKfyIp0RgEEYwOLV5C6zFmOqExHmj2S2WWZXngZCB6wlaPcHpfPh3Dytgvp9+GxR7KmPD3b+wz08=
X-Received: by 2002:a81:62c2:0:b0:506:79fc:3df6 with SMTP id
 w185-20020a8162c2000000b0050679fc3df6mr1413118ywb.127.1676025176713; Fri, 10
 Feb 2023 02:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <3fe5605e-de5a-53dc-0bf0-c6aff81f2453@linaro.org>
In-Reply-To: <3fe5605e-de5a-53dc-0bf0-c6aff81f2453@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 Feb 2023 12:32:45 +0200
Message-ID: <CAA8EJpoj3xepq032n1q2UmKGAk5k0q5DJPe15UcJz+tkrwNWNg@mail.gmail.com>
To: neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU
 on the HDK board
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
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 10 Feb 2023 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 09/02/2023 14:38, Dmitry Baryshkov wrote:
> > Add A660 device to the Qualcomm SM8350 platform and enable it for the
> > sm8350-hdk board. Unfortunately while adding the GPU & related devices I
> > noticed that DT nodes on SM8350 are greatly out of the adress sorting
> > order, so patches 2-4 reorder DT nodes to follow the agreement.
> >
> > Changes since v1:
> > - Dropped merged patches
> > - Expanded commit messages to mention the sort order (by the node
> >    address)
> > - Rebased on top of latest Bjorn's tree
>
> Can you specify which tree and commit ?
>
> I tried next-20230207, next-20230208 & next-20230209 and patch 2 doesn't apply.

It was crafted on top of Bjorn's tree and as such it applies on top of
20230210 without any issues.

>
> On the 3 trees I have:
> d7133d6d25fb arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
> b904227a4b69 arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
> 2a07efb8c086 arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out labels
> e3e654ced376 arm64: dts: qcom: sm8350: Fix DSI PLL size
> 45cd807de143 arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
> 0af6a4012b38 arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
> 1eed7995d9da arm64: dts: qcom: sm8350: Fix DSI1 interrupt
> 6636818ecf0f arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
> f3c08ae6fea7 arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
> 1ccad21aa996 Merge tag 'qcom-arm64-fixes-for-6.2' into arm64-for-6.3
> ...
>
> Can you use --base in format-patch (or use b4 prep !) ?
>
> Thanks,
> Neil
>
> >
> > Changes since v1:
> > - Fixed the subject and commit message for patch 1
> > - Fixed GMU's clocks to follow the vendor kernel
> > - Marked Adreno SMMU as dma-coherent
> > - Dropped comments targeting sm8350 v1, we do not support that chip
> >    revision.
> >
> > Dmitry Baryshkov (6):
> >    dt-bindings: display/msm/gmu: add Adreno 660 support
> >    arm64: dts: qcom: sm8350: reorder device nodes
> >    arm64: dts: qcom: sm8350: move more nodes to correct place
> >    arm64: dts: qcom: sm8350: finish reordering nodes
> >    arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
> >    arm64: dts: qcom: sm8350-hdk: enable GPU
> >
> >   .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
> >   arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
> >   arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
> >   3 files changed, 1354 insertions(+), 1167 deletions(-)
> >
>


-- 
With best wishes
Dmitry
