Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF7C64E2E0
	for <lists+freedreno@lfdr.de>; Thu, 15 Dec 2022 22:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE8E10E044;
	Thu, 15 Dec 2022 21:16:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2798110E044
 for <freedreno@lists.freedesktop.org>; Thu, 15 Dec 2022 21:15:56 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m29so195006lfo.11
 for <freedreno@lists.freedesktop.org>; Thu, 15 Dec 2022 13:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/VBZEpcKP4A7HRf3+eiikNb+ikQq8cYagAbglF7pGtE=;
 b=P38H68dMCVUdc3ewAEWsr8zjWbhPEYIxR7yFrbGbDZQm6004LSjxcFQdeN/dZX3DIS
 kMnSfOnFl4XvGBg4E3tfy17ToPCDMitPAEn1ADsEC+qHb2p/LBz/wPguQoWh89uLz6B9
 HEFmqlG8cSwXcMy0iDVHbDOoGwtTGdqX+x6w1/EDtqShWFvANKkGVZzkuTWehkm6DaU/
 IMVNZGrjQ67s3C1aRRO+LDnqt3X5zsiRB3oc+JgkUyWn7WUVGsHSe4+z74Xx3X5DPR5E
 x6+tiOBBlei4knI+F/sqkfYN4jmxWVH12F/NQw4W/zO2BCGlafcNY0qqqBAn5x0Xr+hU
 +Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/VBZEpcKP4A7HRf3+eiikNb+ikQq8cYagAbglF7pGtE=;
 b=bc7H1qCdloNUx0nTYuypbRA3Y2OKRDuE8CV0VW3cZbwJw3eLG4aqNDMOIiSrmYC9vZ
 Dn8dCUBC9jMSOifmn+b+RcclxXw2O8t1PSi+tdE6qjf0gaeC6JLS41KvF6C9Xiz+AENy
 xSXWAWUQ6qVzyYu5w2JHPypJ5Q1qKgix6BXzoKpkmk7AuPe/wjRuK2PH5xViprN3hZi6
 UObe0qJsW8Voh7eSZU3OUz4RTkjslGF0t9YsUkpwDbAAWrk1EWNiLBdfgC8pAJWuG1lr
 Y82R7G6MeMU3Giss2xnyKA1xEkwxtxFAgAc+AD55g6ynIsIAyj9Ew3lKWGVByiCWWGlc
 EQCA==
X-Gm-Message-State: ANoB5pmfjKIQM5LUEO9Zt2L9WpX9JcJeBoHCyMjuvGqEk/EvZw9F7/wF
 9AYbzhW8bbcUaGZxfGRYazxbfA==
X-Google-Smtp-Source: AA0mqf6VRxIT+v0eIraHsZSXbpJ6PjfSHyVxnlA1KA3u+AWi3svMrNLtJCy9iEDo41e8MomJlcdpHA==
X-Received: by 2002:a05:6512:b10:b0:4a4:68b8:c2ad with SMTP id
 w16-20020a0565120b1000b004a468b8c2admr10335227lfu.4.1671138954856; 
 Thu, 15 Dec 2022 13:15:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 12-20020ac25f4c000000b00485caa0f5dfsm16880lfz.44.2022.12.15.13.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 13:15:54 -0800 (PST)
Message-ID: <d41e29a9-5da6-3843-5018-9674e7d56505@linaro.org>
Date: Thu, 15 Dec 2022 23:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@gmail.com,
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org,
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
References: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
 <ca15a54b-8040-5e4f-a78e-12b7f8a554e1@linaro.org>
 <CAE-0n53bREwEMV4aP=ySPuPP8mMbDr=Unbjw_bW0MNN7hTsWRw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53bREwEMV4aP=ySPuPP8mMbDr=Unbjw_bW0MNN7hTsWRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: do not complete
 dp_aux_cmd_fifo_tx() if irq is not for aux transfer
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/12/2022 22:10, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-12-15 10:46:42)
>> On 15/12/2022 20:32, Kuogee Hsieh wrote:
>>>        if (!aux->cmd_busy)
>>>                return;
>>>
>>>        if (aux->native)
>>> -             dp_aux_native_handler(aux, isr);
>>> +             ret = dp_aux_native_handler(aux, isr);
>>>        else
>>> -             dp_aux_i2c_handler(aux, isr);
>>> +             ret = dp_aux_i2c_handler(aux, isr);
>>>
>>> -     complete(&aux->comp);
>>> +     if (ret == IRQ_HANDLED)
>>> +             complete(&aux->comp);
>>
>> Can you just move the complete() into the individual handling functions?
>> Then you won't have to return the error code from dp_aux_*_handler() at
>> all. You can check `isr' in that function and call complete if there was
>> any error.
> 
> I'd prefer we apply my patch and pass the irqreturn_t variable to the
> caller of this function so spurious irqs are shutdown. Should I send it
> as a proper patch?

I'm for handling the spurious IRQs in a proper way. However I believe 
that it's not related to the issue Kuogee is trying to fix.

Thus I think we should have two separate patches: one fixing the EDID 
corruption issue (for which the proper fix is !isr check, IIUC) and the 
irqreturn_t. And for the irqreturn_t it might be beneficial to move 
complete() call to the dp_aux_foo_handler(). Or might be not. That would 
depend on the patch itself.


-- 
With best wishes
Dmitry

