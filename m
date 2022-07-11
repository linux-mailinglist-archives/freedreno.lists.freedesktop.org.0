Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042957080A
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 18:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2C18F891;
	Mon, 11 Jul 2022 16:10:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3595A8F88E
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657555806; x=1689091806;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=LrflyR2sIyMLPwJevZsn7OlbIverTVP5EtlQopb2mBs=;
 b=uE+dYXATpB8LA5N4Qu+3FKY21xzzD1ltDvgSPB2SCot5yJRt9ETm2XAn
 RlubCgNmI9bZJh3Qx3heCcdjR4bP+TsWL8GGT9wdMiYvM6pDw0nJH4C5v
 j63YAddme74B5strKdYWoR22IKijYR3FTJYYC8ULNOlHpqq7ZITQ6L9FT 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Jul 2022 09:10:05 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 09:10:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 09:10:05 -0700
Received: from [10.110.49.65] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Jul
 2022 09:10:03 -0700
Content-Type: multipart/alternative;
 boundary="------------BoidJXLzYrAfDd8tarIo4iGd"
Message-ID: <9abb6a67-e7a5-a3dc-1bff-30e9d2922b84@quicinc.com>
Date: Mon, 11 Jul 2022 09:09:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <1657555122-18605-1-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH] arm64: dta: qcom: sc7280: delete vdda-1p2
 and vdda-0p9 from mdss_edp
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>,
 Rob
 Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 quic_mkrishn@quicinc.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant@quicinc.coml, LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--------------BoidJXLzYrAfDd8tarIo4iGd
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 7/11/2022 9:02 AM, Doug Anderson wrote:
> Hi,
>
> On Mon, Jul 11, 2022 at 8:58 AM Kuogee Hsieh<quic_khsieh@quicinc.com>  wrote:
>> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
>> by dp combo phy. Therefore remove them from dp controller.
>>
>> Signed-off-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 3 ---
>>   1 file changed, 3 deletions(-)
> You also need to remove it from
> `arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi`.

|arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi: vdda-1p2-supply = 
<&vdd_a_usbssdp_0_1p2>;|

|I did not see above line at sc7280-herobrine.dtsi at latest msm-next tree.
|

>
> -Doug
--------------BoidJXLzYrAfDd8tarIo4iGd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/11/2022 9:02 AM, Doug Anderson
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hi,

On Mon, Jul 11, 2022 at 8:58 AM Kuogee Hsieh <a class="moz-txt-link-rfc2396E" href="mailto:quic_khsieh@quicinc.com">&lt;quic_khsieh@quicinc.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
by dp combo phy. Therefore remove them from dp controller.

Signed-off-by: Kuogee Hsieh <a class="moz-txt-link-rfc2396E" href="mailto:quic_khsieh@quicinc.com">&lt;quic_khsieh@quicinc.com&gt;</a>
---
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 3 ---
 1 file changed, 3 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You also need to remove it from
`arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi`.</pre>
    </blockquote>
    <p><code style="font-family: WorkAroundWebKitAndMozilla, monospace;
        background-color: var(--surface-secondary); border-radius: 2px;
        color: var(--text-high-contrast); padding: 0px; line-height:
        1.5;">arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi:
        vdda-1p2-supply = &lt;&amp;vdd_a_usbssdp_0_1p2&gt;;</code></p>
    <p><code style="font-family: WorkAroundWebKitAndMozilla, monospace;
        background-color: var(--surface-secondary); border-radius: 2px;
        color: var(--text-high-contrast); padding: 0px; line-height:
        1.5;">I did not see above line at sc7280-herobrine.dtsi at
        latest msm-next tree.<br>
      </code></p>
    <blockquote type="cite"
cite="mid:CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

-Doug
</pre>
    </blockquote>
  </body>
</html>

--------------BoidJXLzYrAfDd8tarIo4iGd--
