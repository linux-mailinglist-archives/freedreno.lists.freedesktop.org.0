Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF64625B84
	for <lists+freedreno@lfdr.de>; Fri, 11 Nov 2022 14:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2010E81A;
	Fri, 11 Nov 2022 13:52:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FD410E822
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 13:52:25 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id 21so7727576edv.3
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 05:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JXM+RlfecQsl8R3fGlmC6x2JLEc2q3nlhhTEJRNAqbQ=;
 b=mj7EW2C4wI/AYrFuJnRR3eDzgId1RmzDGW48XzKmelMZyNEnRLGZxFruOa2GzQX7pG
 9MLy4XDPrtTHeNIOp4CQhL6m7V+lisnBvntxIxnA9z80qjgzEBkrylHNLE3q965PTSoZ
 MJNyPhzJFl7IZpvHrOLcQBFZ7DJ5Ief6N9gaVsbRGPRdRSYyjGQ5ECz6/3U+NSzahXF+
 yrlIzAWBGc8dG+U0VZvsUqIyMMDbd6HGh9a5r0akpvZiho/UyndEZJUzqHAyUkB9yAHp
 as5oFzLT/3JZ3J5jT3BzvjD8PhGQPNcmTe9JmUesqI9OrQhQd0e7KiwBN17ZcTMFB7i6
 8PFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXM+RlfecQsl8R3fGlmC6x2JLEc2q3nlhhTEJRNAqbQ=;
 b=o3pX8zeZu9lXf0+3sr2Du/Ut1P7Dwsw5CucgAqZHZoa86ljYavB0vilvrhM3RyCYvh
 1uRPEeHrmRY5LZaa3DNTe9AN6yIiPxDlf7ByPz+QGqrbBaixzlfIhNtG0IhFAm9TAVO7
 CWlNOxVPHibDyjKu6nZV6+bQvkwr0nTxr9dF39jt/TNbhFiPHYNvnrEDF4w3xwrhYXUc
 hMU5NrpzfkalCH3M9Hl007A9XSTX1Xxk1Wqq/T1XnKcK0IqZcOpW1zhF7kJoTt6drC4g
 RJgbSNjNmtCGHD7PI/hupL4bfF5/2jlYfNDCE18RbRLrSrDBPTt23VS7oFUusfexLb9w
 YpgA==
X-Gm-Message-State: ANoB5pmIH8DmqBs5W868USwRWhFnGhPE9hT1FhJ42g+VRUUfdXZ5dlUi
 qQfdI2ftKidtXY/b+G55QeVMRqKihe4z4fd6gvstYA==
X-Google-Smtp-Source: AA0mqf6c96jhEwp5IIcqNLzVQh7v/brBFkuXH94v9FZGLFHBvHuFSMAHGSUBmt76nOSVZW30mNXKo7pEKrfyx0BQZrA=
X-Received: by 2002:aa7:d716:0:b0:461:cdfb:3072 with SMTP id
 t22-20020aa7d716000000b00461cdfb3072mr1594817edq.56.1668174744060; Fri, 11
 Nov 2022 05:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-7-robert.foss@linaro.org>
 <20221028134439.ugja55guopmql4nk@baldur>
In-Reply-To: <20221028134439.ugja55guopmql4nk@baldur>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 11 Nov 2022 14:52:12 +0100
Message-ID: <CAG3jFysvDa7QR5cXZCjHx-28ir40TVngBDUfEy0-Xgo-_jhBmQ@mail.gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 6/9] arm64: dts: qcom: sm8350: Use 2
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>, robdclark@gmail.com,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 28 Oct 2022 at 15:44, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 02:08:09PM +0200, Robert Foss wrote:
> > Use two interconnect cells in order to optionally
> > support a path tag.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350.dtsi | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index 606fab087945..b6e44cd3b394 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -1543,56 +1543,56 @@ apps_smmu: iommu@15000000 {
> >               config_noc: interconnect@1500000 {
> >                       compatible = "qcom,sm8350-config-noc";
> >                       reg = <0 0x01500000 0 0xa580>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
>
> You also need amend all the interconnects references with the additional
> tag cell.

Ack

>
> Regards,
> Bjorn
>
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               mc_virt: interconnect@1580000 {
> >                       compatible = "qcom,sm8350-mc-virt";
> >                       reg = <0 0x01580000 0 0x1000>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               system_noc: interconnect@1680000 {
> >                       compatible = "qcom,sm8350-system-noc";
> >                       reg = <0 0x01680000 0 0x1c200>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               aggre1_noc: interconnect@16e0000 {
> >                       compatible = "qcom,sm8350-aggre1-noc";
> >                       reg = <0 0x016e0000 0 0x1f180>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               aggre2_noc: interconnect@1700000 {
> >                       compatible = "qcom,sm8350-aggre2-noc";
> >                       reg = <0 0x01700000 0 0x33000>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               mmss_noc: interconnect@1740000 {
> >                       compatible = "qcom,sm8350-mmss-noc";
> >                       reg = <0 0x01740000 0 0x1f080>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               lpass_ag_noc: interconnect@3c40000 {
> >                       compatible = "qcom,sm8350-lpass-ag-noc";
> >                       reg = <0 0x03c40000 0 0xf080>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               compute_noc: interconnect@a0c0000{
> >                       compatible = "qcom,sm8350-compute-noc";
> >                       reg = <0 0x0a0c0000 0 0xa180>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> > @@ -2420,14 +2420,14 @@ usb_2_ssphy: phy@88ebe00 {
> >               dc_noc: interconnect@90c0000 {
> >                       compatible = "qcom,sm8350-dc-noc";
> >                       reg = <0 0x090c0000 0 0x4200>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               gem_noc: interconnect@9100000 {
> >                       compatible = "qcom,sm8350-gem-noc";
> >                       reg = <0 0x09100000 0 0xb4000>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> > --
> > 2.34.1
> >
