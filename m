Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1EE932E75
	for <lists+freedreno@lfdr.de>; Tue, 16 Jul 2024 18:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FBC10E7DE;
	Tue, 16 Jul 2024 16:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HxAvmaZ4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360010E7DF
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 16:37:59 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-651da7c1531so52434717b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721147879; x=1721752679; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Inq9wHo9haYW+I9Tylrr0gohQZyxyP5BU7osayMiXTI=;
 b=HxAvmaZ4Ss8aJHGL+6CzLDz1Sw22UXxu7DDLzhmHwT6MRKkKssk2ifpSPbPRdUAEqQ
 /kzWDWK4gHcUCTVVA1gVLfx5SG3Ff6sNSt5oymhDeR1vCTs6y44W39aoqr9lE4qQ2v1Q
 tqObnCEIopHUe8dbPX4DN93QsY8NXaJCjcofb/gSkRIQOZk56Zuwuu8r2m0ZvJFLKR04
 Pfoxnkh5BaKJGCPML3hfLEUIhidTPB9E7LUYDKibVmTBQMO/9DSAarDwpYBpAUWbc24k
 zSs47wqNJPCAcLrrQ3e9c/bKBOWxZWzv2nHvE4R04u/jhs705p1l5lgQKXzBqcW9iZt6
 fFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721147879; x=1721752679;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Inq9wHo9haYW+I9Tylrr0gohQZyxyP5BU7osayMiXTI=;
 b=vlWONUpn8qs3l6Nnk5hH9VgtS3HERjKTqIBvQKcnZ5M5WiDkjfhdIf7d7odplcIfj0
 sF51kCkNvZ7ivJzgcPU8X9pQdbLZXSMn1aQyau4Rv7YLhpf/r4YK0EnZFE99On5keQED
 A6qwoxkenVDEJKG0WAbamg3lWhQbCf3T/B2OrG4FafI4AwCPEgXapJ+B3UjUDMFQ8Tpi
 DQMxf6W8X7XnYffjbvI+ZAirSnAHk6H1W/1BxLMarlVlRPoRcHf8eWX8TY8jSEg5YzuO
 Te+UTjS1oFZkHsFQbDuH10KQvfBDb2xlKoxfYeEK6UZIEZhig3PLFjgm+BnrUhIRRCXf
 yWdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoItGUZ5k8b4XGIgkbPnoZHDFNgF/SQq3hz32fjrtD1/KYxaLnvD4iX+ZJK8/qpRwkGX8B8eKqdcIldzzfFFMcJpu1sTSzXAYPiwMRJV5I
X-Gm-Message-State: AOJu0YxERcqA7+jWmZIVmL0WeRxZhFUrDoFzK/JlBNMZKXS2j12zY4z7
 z6qC8w2T6gsjrzfCpl9CxhNr8n1Tz8sD7XOOGY/kHTDR7pfKAZAEaM89GTk/6BLAah8AP9JAKd5
 piTO3OJWwOlM0SSeGjH0hEw3uV5SibQeXUeZcTg==
X-Google-Smtp-Source: AGHT+IE+6hxj9x884OAMB4VNRlYKsy/S+Y0o45dUnN/039E9rINPR7H3k9hGW0oD/pMtgKJEzaq/W5A/siUNC58eij4=
X-Received: by 2002:a81:b402:0:b0:61b:1f0e:10 with SMTP id
 00721157ae682-66380f1304amr31569737b3.4.1721147878623; 
 Tue, 16 Jul 2024 09:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr>
 <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
In-Reply-To: <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 19:37:47 +0300
Message-ID: <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 16 Jul 2024 at 17:34, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 16/07/2024 15:11, Konrad Dybcio wrote:
>
> > On 27.06.2024 5:54 PM, Marc Gonzalez wrote:
> >
> >>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 100 +++++++++++++++++++++++++++++++++-
> >>  1 file changed, 99 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >> index ba5e873f0f35f..417c12534823f 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> >> @@ -2785,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
> >>                               <&mdss_dsi0_phy 0>,
> >>                               <&mdss_dsi1_phy 1>,
> >>                               <&mdss_dsi1_phy 0>,
> >> -                             <0>,
> >> +                             <&hdmi_phy 0>,
> >>                               <0>,
> >>                               <0>,
> >>                               <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
> >> @@ -2890,6 +2890,14 @@ dpu_intf2_out: endpoint {
> >>                                                      remote-endpoint = <&mdss_dsi1_in>;
> >>                                              };
> >>                                      };
> >> +
> >> +                                    port@2 {
> >> +                                            reg = <2>;
> >> +
> >> +                                            dpu_intf3_out: endpoint {
> >> +                                                    remote-endpoint = <&hdmi_in>;
> >> +                                            };
> >> +                                    };
> >>                              };
> >>                      };
> >>
> >> @@ -3045,6 +3053,96 @@ mdss_dsi1_phy: phy@c996400 {
> >>
> >>                              status = "disabled";
> >>                      };
> >> +
> >> +                    hdmi: hdmi-tx@c9a0000 {
> >
> > Please prefix the labels (hdmi: and hdmi_phy:) with mdss_
> >
> > Otherwise, this looks good
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >
> >
> > One thing I noticed (testing on the 8998 MTP), enabling MDSS (not necessarily
> > HDMI, mdss and mdp is enough) results in SMMU lockups about 30% of the time..
> >
> > [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.913412] platform c901000.display-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> > [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.930647] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/display-controller@c901000
> > [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.952338] msm_hdmi_phy c9a0600.hdmi-phy: supply vddio not found, using dummy regulator
> > [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.967917] msm_hdmi_phy c9a0600.hdmi-phy: supply vcca not found, using dummy regulator
> > [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
> > [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
> > [    4.984122] Bluetooth: hci0: setting up wcn399x
> > [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>
> Interesting. I don't think I've noticed any lock-ups
> across multiple reboots.
>
> FWIW, I get similar warnings about "Fixed dependency cycle(s)" on my custom DT.
>
> [    0.055349] platform 1da4000.ufshc: Fixed dependency cycle(s) with /soc@0/phy@1da7000
> [    0.055525] platform 1da4000.ufshc: Fixed dependency cycle(s) with /soc@0/phy@1da7000
> [    0.055584] platform 1da7000.phy: Fixed dependency cycle(s) with /soc@0/ufshc@1da4000
> [    0.060279] platform c8c0000.clock-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-phy@c9a0600
> [    0.060494] platform c900000.display-subsystem: Fixed dependency cycle(s) with /soc@0/clock-controller@c8c0000
> [    0.062432] platform hdmi-out: Fixed dependency cycle(s) with /soc@0/i2c@c1b5000/tdp158@5e
> ...
> [   18.534346] adreno 5000000.gpu: Adding to iommu group 2
> [   18.540215] msm-mdss c900000.display-subsystem: Adding to iommu group 3
> [   18.544695] platform c901000.display-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> [   18.551239] platform c901000.display-controller: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> [   18.562685] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/i2c@c1b5000/tdp158@5e
> [   18.574122] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/display-controller@c901000
> [   18.617640] platform c9a0000.hdmi-tx: Fixed dependency cycle(s) with /soc@0/i2c@c1b5000/tdp158@5e
> [   18.618885] i2c 2-005e: Fixed dependency cycle(s) with /soc@0/display-subsystem@c900000/hdmi-tx@c9a0000
> [   18.627768] tdp158-bridge 2-005e: supply vcc not found, using dummy regulator
> [   18.636853] tdp158-bridge 2-005e: supply vdd not found, using dummy regulator
>
> It looks like some of these warnings were pre-existing,
> but some might have been added by my patches?
>
> Do they need looking into?
> I'm slightly confused.

No, that's fine. It is the SMMU issue that Konrad has been asking you
to take a look at.


-- 
With best wishes
Dmitry
