Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D7544B5F
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EBC11A133;
	Thu,  9 Jun 2022 12:10:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AD011A08B
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:10:26 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u26so36938717lfd.8
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QSG20Dj6ndvabyRb1c78eTbY+WPCIgmk0mLj5fnfkZc=;
 b=yQKeO/Z2I0TkmD51XdZCPv8rndgXW2el6J4HIJe8EIgTxElnD7e53n1HVblBwk0mSH
 /OL51MvESzk+OSfstbvtRK7HkC5CfWoBkQ5DafO7X4w4naZypTtCpPv3wtQuHf5w/APp
 AdtLE6rLqvrH59UL2r7T+mFuUG5rOnl+s0EhkCr5rKP6JQdyoRBRMu7+/dA1HzvQjSfA
 fVNYV4DEU8dNTo8jAfZ4fOxFTT0CIUBgFGtgSQb5Cu9RpfO10idNjaP9F4DC9R8qd03/
 ricINP2QR0CJS8dwHMPx6jjXnkITY2DYestbvJJjvut1Qu2V+HkwjZ/C3dwVjViaLc1r
 Yscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QSG20Dj6ndvabyRb1c78eTbY+WPCIgmk0mLj5fnfkZc=;
 b=xtgxczwaW+7EbACnujv0IxVOK8NRjQulPzGk7hOGYvYuZ/XRt8SEMvaKRc+vB2K/vf
 Yq+MezBJvXbzz9Wu+aCRcDS3BCySPXVBiUkyQd1KkoDdiIPdwfDlkXb+gDMrENXGGQkl
 mnXdlmEvGJrz/nP1Pd9IibVXOtrmVr3aCF4RNpQOZaYEKX7pmTFQ+oQOUfLi2BG9abS0
 QpiRWAdGWDQVXMAKJYhg/OdPOBnFAv38cC8FhOw7lV/l8SXf58lksnHvSv0VKL/3kouQ
 dQTD5sE07OkbVnMr8B+/Fg6IQDwJgqrbNeOE0a/5/yoouEfX9Wp4acnOxFxgvahvJVLb
 lXxg==
X-Gm-Message-State: AOAM531cEcZWkcA++1AYsDOVxMJQgVCLYvmZUPWzeYDpuRW8h43vP73A
 c80sgQGI7OyWO2eL/TAbRlRaCA==
X-Google-Smtp-Source: ABdhPJx4hS6cWFi0csc42PotruFgLnEop7eKNzSQaLClCXHVQwjjzFnQZjWmDt88EW5Yplrdbl5cVQ==
X-Received: by 2002:a05:6512:92c:b0:479:7a74:8427 with SMTP id
 f12-20020a056512092c00b004797a748427mr4722918lft.126.1654776624478; 
 Thu, 09 Jun 2022 05:10:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a19dc59000000b0047255d211afsm4199310lfj.222.2022.06.09.05.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 05:10:24 -0700 (PDT)
Message-ID: <98c98ef4-06df-0aae-ecf7-77e181f566f4@linaro.org>
Date: Thu, 9 Jun 2022 15:10:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
 <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 01/12] dt-bindings: display/msm: hdmi:
 split and convert to yaml
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/06/2022 15:37, Krzysztof Kozlowski wrote:
> On 08/06/2022 14:07, Dmitry Baryshkov wrote:
>> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
>>
>> Changes to schema:
>> HDMI:
>>   - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>>   - dropped qcom,tx-ddc-* from example, they were not documented
>>
>> PHY:
>>   - moved into phy/ directory
>>   - split into QMP and non-QMP PHY schemas
>>
>> Co-developed-by: David Heidelberg <david@ixit.cz>
> 
> David also needs to SoB here.

Thank you for the review and for the comments.

-- 
With best wishes
Dmitry
