Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB974FB99
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 01:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F128610E45B;
	Tue, 11 Jul 2023 23:01:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068F610E45E
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 23:01:14 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a36b309524so5409250b6e.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689116473; x=1691708473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sNgvvti22BaVOQpn7FMXRFccxTxteRm9qMZTNS49wJc=;
 b=SnsZzYcxC8uETuqw89Oj9ypwhEjQ5xsUGI4SCT2U/HLgMMEp7sCEUWb8Vfj8I33+63
 oFukQSrN7Qm89fretmaq0T4Dew04HmVnlsTcP8GFhXCFKKtYp0x6/Q0p9T8S8J4DhpTh
 BuAWsNJv/LJdL6mBX762L1gy5A8LxqvQMHjVoK08oJPeaNxpbVtPR27aIDI0FbinbM7a
 fanXkh2FvbI3T7LhG0lTeaEhfgZ2CdTQMSC8/XbuLMjxgIxl3lwLuq7MsRVt69g5VV1G
 7nmWluz6vuiaiquNi3nwbiScFyynqIVDVaC5AwmdOakV5IyV+Ld2qNRworcXYC6cwOkA
 0i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689116473; x=1691708473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sNgvvti22BaVOQpn7FMXRFccxTxteRm9qMZTNS49wJc=;
 b=F9w0xO1upjse9GQ1IFG15ul6z3bS8GmYDPeHIbwcJyYunHQO/I2a3FUUFGZF5KN98D
 OzWXWvkxBbXkYdor0cwP9s1PGZ1L8cmmZqkZzVHWYR/f6pZs6YIz5rbAqbmbJuKK+VrE
 ijnJzOxaUucyg5ctmTrcAb6O3jxlcYv+AxGTDrOyHPxHy7DBQC0ZhGoTd/5yFdA9zJNP
 ME7WgmbLr8EYZ9xQLIEA0eA69HMIlWNXT2z4OeBrFD0j0Cg9Ggu6ymd1v13KQayvWkLG
 Fv0dBYOCqt6DuCbaFICDwK3ysUT6G/QvR+FAffUCO++KkfQkBpqhBBG7Aq/P2UOSVspy
 plPQ==
X-Gm-Message-State: ABy/qLbyMIg87Bcv7ZWXnpsCcq7h3mx5bL0mUZI0rlHVf3+M2+mp4lee
 0wNG5HgYeyBIl7aicn/aX1KGORzJPwcjiykvDUv2NQ==
X-Google-Smtp-Source: APBJJlEkQ9HSi+CqGWUfrEa9mQbC5ePz8PSqoOABC9giUvRXnz9F6mkPYDAMXjPDWPnX5V9zeoA+Hz8x45tFMf9ARu4=
X-Received: by 2002:a05:6808:1441:b0:3a4:1319:9af1 with SMTP id
 x1-20020a056808144100b003a413199af1mr6467128oiv.51.1689116473078; Tue, 11 Jul
 2023 16:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
 <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
In-Reply-To: <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jul 2023 02:01:02 +0300
Message-ID: <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add
 onboard USB-C redriver
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
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 at 01:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 12.07.2023 00:39, Dmitry Baryshkov wrote:
> > On 12/07/2023 00:36, Konrad Dybcio wrote:
> >> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> >>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >> [...]
> >>
> >>> +            port@1 {
> >>> +                reg = <1>;
> >>> +
> >>> +                redriver_phy_con_ss: endpoint {
> >>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> >>> +                    data-lanes = <0 1 2 3>;
> >> That's USB+DP lines combined, or how does it work? I'm confused :/
> >
> > 4 generic purpose SS lanes, which can be purposed for USB or for DP.
> Okay, so my gut did better than my brain.
>
> Other than that, I'm reading the bindings and it looks like ports 0 and
> 1 may possibly be swapped?

Yes. But if I get schematics right, the lanes are not swapped in this case.

>
> Konrad
> >
> >>
> >> Konrad
> >>> +                };
> >>> +            };
> >>> +
> >>> +            port@2 {
> >>> +                reg = <2>;
> >>> +
> >>> +                redriver_usb_con_sbu: endpoint {
> >>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
> >>> +                };
> >>> +            };
> >>> +        };
> >>> +    };
> >>>   };
> >>>     &mdss {
> >>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
> >>>   };
> >>>     &usb_1_qmpphy_typec_mux_in {
> >>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
> >>> +    remote-endpoint = <&redriver_phy_con_ss>;
> >>>   };
> >>>     &usb_2 {
> >>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
> >>>               port@1 {
> >>>                   reg = <1>;
> >>>                   pm8150b_typec_mux_out: endpoint {
> >>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> >>> +                    remote-endpoint = <&redriver_usb_con_ss>;
> >>> +                };
> >>> +            };
> >>> +
> >>> +            port@2 {
> >>> +                reg = <2>;
> >>> +
> >>> +                pm8150b_typec_sbu_out: endpoint {
> >>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
> >>>                   };
> >>>               };
> >>>           };
> >



-- 
With best wishes
Dmitry
