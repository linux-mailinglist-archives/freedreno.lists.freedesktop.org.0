Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603315525DC
	for <lists+freedreno@lfdr.de>; Mon, 20 Jun 2022 22:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582A710E18D;
	Mon, 20 Jun 2022 20:37:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA47A10E155
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 20:37:46 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k20so6782922ljg.2
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jun 2022 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4AgI1OeqvKa54AE3ibmZQ72eMIxlgyZDqRzxMCeBNr8=;
 b=QBtuY4wXg/c+FMySfQQzgbU6tlAeaQ8DmAALE6apPfUuxC9bf3/d5ySZUDSgao1o6b
 KjZhA6Qq37l3Sk6af89F26XLK2Bmx7+sKuhgZt2jtqxjfS8vKf7ZqXX9A86jUY5J5oGV
 byPli33F5D1I3Rg8tYNfuH9Rfq/gGK1TIKMxduF1yAKIKrBQxN6w1TsIL1oZ/q+IifoM
 IKXHeZ1xNOLP56e8C6BdcRr2NV/fgfKj97ccQAVUcAcrm/wKi/8xsz1IVmCJo4pt80ny
 DzGNPMrSlGvseJtj5Gvg7taOGess691R4KpLV72rH8SKl4HFq45euJsXXrQdAnT9asfa
 EoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4AgI1OeqvKa54AE3ibmZQ72eMIxlgyZDqRzxMCeBNr8=;
 b=6G1l5yZeFxZgKAro2aUZHNiIDRLcGRDxnxs/iRJtMcGpx2jyBuGs2lPI1BzccgQ2gE
 ok4HJMwM3CxH6uxcpu4/eiCEoEN28hb/9vH+mAcQqZw95SuHnJZz/RalUdC9hxoU/abF
 +fs/bB+y5GSpxku9Q+chFaFNkZxwl12a1Fpy+K3kyNahaAibNnJdpePWkBxLj6+lphrL
 mVVWem65MsNuVJtvxUHOYm+tXCOSOE28RRxg23AOyzlDUGbT+C3G0PtoZ9lMN6OnptQv
 RfeH//1jTxh6leLN1FBpk6KEj2IWZNDVOznpTiVgivqeklnIkc9n+Tnm6vKq7IQx6u/l
 1EXQ==
X-Gm-Message-State: AJIora9NW8qtO0aPjTw+6IHz0KUNr1sD9kyfd+7yAWlG5fQ3bYkzlAnA
 t4DUMDXH9zBTieURCUm95hde/w==
X-Google-Smtp-Source: AGRyM1v1weyBbsnBoedcMba+ZaM6RXMXAZYUhNBE+zvVspODn28UBal0BFmiHO4VWi+4KkT7KnZJ6w==
X-Received: by 2002:a05:651c:23b:b0:259:fee:cc2a with SMTP id
 z27-20020a05651c023b00b002590feecc2amr12503239ljn.400.1655757465110; 
 Mon, 20 Jun 2022 13:37:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a19671e000000b0047f71cca2d5sm458137lfc.100.2022.06.20.13.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 13:37:44 -0700 (PDT)
Message-ID: <d7563107-ecd3-1ec7-c654-db493216636b@linaro.org>
Date: Mon, 20 Jun 2022 23:37:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1655755943-28594-1-git-send-email-quic_khsieh@quicinc.com>
 <1655755943-28594-3-git-send-email-quic_khsieh@quicinc.com>
 <3d8f5a58-0efb-af27-eb19-ee2236a942ea@linaro.org>
 <3af48ac4-c9c2-5636-c18e-6e8c2ec2472d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3af48ac4-c9c2-5636-c18e-6e8c2ec2472d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v14 2/3] phy: qcom-qmp: add
 regulator_set_load to dp phy
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
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/06/2022 23:22, Kuogee Hsieh wrote:
> 
> On 6/20/2022 1:15 PM, Dmitry Baryshkov wrote:
>> On 20/06/2022 23:12, Kuogee Hsieh wrote:
>>> This patch add regulator_set_load() before enable regulator at
>>> DP phy driver.
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>   drivers/phy/qualcomm/phy-qcom-qmp.c | 40 
>>> ++++++++++++++++++++++++++++---------
>>
>> This was not rebased. There is no phy-qcom-qmp.c in phy-next.
> 
> is https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git 
> phy-next tree?

Yes. The 'next' branch. The file in question was removed in the commit 
a50280ead1b6a56f3b4738808a8c2be7c2c63666


-- 
With best wishes
Dmitry
