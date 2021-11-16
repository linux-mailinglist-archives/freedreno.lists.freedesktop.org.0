Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF044537EB
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 17:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E5E89056;
	Tue, 16 Nov 2021 16:43:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FEA89056
 for <freedreno@lists.freedesktop.org>; Tue, 16 Nov 2021 16:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637081022; x=1668617022;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=jqQu1vMEteGZo4A7sbUR2gaHQ7mP8SS3Dj5XaKo+y84=;
 b=wqAa3eFkCixBC5WVnJjQED8guJ8u5FCwOg9e+6kGH/Zif4qrvFLOAidF
 iaZTHChnP2bg8Ef0kTzRxhiLmi6JCLmGb7rJNSeKCZF1KQ8Gw3C3tBxUl
 WGlN6i7ya7e3LdCN8BZ2mlTBSvwfKTkhHI0VnfnLGg+KdDatN1ZI1Yb3U A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Nov 2021 08:43:40 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:43:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 16 Nov 2021 08:43:40 -0800
Received: from [10.110.100.33] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 16 Nov
 2021 08:43:38 -0800
Content-Type: multipart/alternative;
 boundary="------------ShZmnl8Wz9OKzti9yrpniyQJ"
Message-ID: <88a5219e-c82a-87fa-6af3-578238d6027b@quicinc.com>
Date: Tue, 16 Nov 2021 08:43:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <devicetree@vger.kernel.org>,
 <robdclark@gmail.com>, <robh+dt@kernel.org>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH v3] arm64: dts: qcom: sc7280: Add Display
 Port node
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, quic_mkrishn@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 quic_kalyant@quicinc.coml
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--------------ShZmnl8Wz9OKzti9yrpniyQJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 11/15/2021 3:39 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-11-02 16:44:33)
>> From: Kuogee Hsieh<khsieh@codeaurora.org>
>>
>> Signed-off-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
>> ---
> What tree is this based on? I don't see edp_phy upstream for sc7280

this patch is depend on  --> [PATCH v2 4/4] arm64: dts: qcom: sc7280: 
add edp display dt nodes

it had completed reviewed.

https://mail.codeaurora.org/?_task=mail&_caps=pdf%3D1%2Cflash%3D0%2Ctiff%3D0%2Cwebp%3D1&_uid=1789&_mbox=INBOX&_action=show


>
> Otherwise, looks good to me.
>
> Reviewed-by: Stephen Boyd<swboyd@chromium.org>
--------------ShZmnl8Wz9OKzti9yrpniyQJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/15/2021 3:39 PM, Stephen Boyd
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Quoting Kuogee Hsieh (2021-11-02 16:44:33)
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Kuogee Hsieh <a class="moz-txt-link-rfc2396E" href="mailto:khsieh@codeaurora.org">&lt;khsieh@codeaurora.org&gt;</a>

Signed-off-by: Kuogee Hsieh <a class="moz-txt-link-rfc2396E" href="mailto:quic_khsieh@quicinc.com">&lt;quic_khsieh@quicinc.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What tree is this based on? I don't see edp_phy upstream for sc7280</pre>
    </blockquote>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Lucida
        Grande&quot;, Verdana, Arial, Helvetica, sans-serif; font-size:
        11px; font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 700; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(235, 235, 235); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">this patch is
        depend on  --&gt; [PATCH v2 4/4] arm64: dts: qcom: sc7280: add
        edp display dt nodes</span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Lucida
        Grande&quot;, Verdana, Arial, Helvetica, sans-serif; font-size:
        11px; font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 700; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(235, 235, 235); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">it had
        completed reviewed. <br>
      </span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Lucida
        Grande&quot;, Verdana, Arial, Helvetica, sans-serif; font-size:
        11px; font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 700; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(235, 235, 235); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><a class="moz-txt-link-freetext" href="https://mail.codeaurora.org/?_task=mail&amp;_caps=pdf%3D1%2Cflash%3D0%2Ctiff%3D0%2Cwebp%3D1&amp;_uid=1789&amp;_mbox=INBOX&amp;_action=show">https://mail.codeaurora.org/?_task=mail&amp;_caps=pdf%3D1%2Cflash%3D0%2Ctiff%3D0%2Cwebp%3D1&amp;_uid=1789&amp;_mbox=INBOX&amp;_action=show</a></span></p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Lucida
        Grande&quot;, Verdana, Arial, Helvetica, sans-serif; font-size:
        11px; font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 700; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(235, 235, 235); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><br>
      </span></p>
    <blockquote type="cite"
cite="mid:CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Otherwise, looks good to me.

Reviewed-by: Stephen Boyd <a class="moz-txt-link-rfc2396E" href="mailto:swboyd@chromium.org">&lt;swboyd@chromium.org&gt;</a>
</pre>
    </blockquote>
  </body>
</html>
--------------ShZmnl8Wz9OKzti9yrpniyQJ--
