Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A36A86F0
	for <lists+freedreno@lfdr.de>; Thu,  2 Mar 2023 17:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD74010E244;
	Thu,  2 Mar 2023 16:40:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759010E244
 for <freedreno@lists.freedesktop.org>; Thu,  2 Mar 2023 16:40:06 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id s20so22837137lfb.11
 for <freedreno@lists.freedesktop.org>; Thu, 02 Mar 2023 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=clemDdlw5AVVfbBMfMMVk1mB/n91ZZIxJxGYFhtaE10=;
 b=ZcWzd2VISv7VbjUNUOKAd/ScIHUIlD+kat046CfvIzTRNnRvWidoivUQJBI3P2pjEZ
 CX+7iV9lc2HS9oMSqLt+RlZy/vON+VOJlP80aYDi62yiZnqnbfZU+sV082TlH2Ke1dGT
 gWITtMMdjJOOHllC5SmBmxo5X6qF8xdJBoyLTyNAjEgb9ABPnWCtZ7CRyNwI1sQOEEOj
 LDAE8Jgl0CkqG7rSUE7WHa2tiPGyLmMyer7I6eu4DqcYHosmuUrkbXuHOj8+8O9st8O6
 qmzZrGuZ3/VKs4dkrfb1X+PZWK8sqxeb8v9+xmFTTQdnevZt4L6a8bcyHWWtoB7MgbmC
 KWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=clemDdlw5AVVfbBMfMMVk1mB/n91ZZIxJxGYFhtaE10=;
 b=cllWr1x0kPJAXHZMq2xeEpFPeaoFsevdRfqpOcekhE+lMJuvS5Gpn5t/uMey11ia8Q
 pKGSLRIXiDr03BkV2899l1LhYHTN2S2hBB7wTz9dLh8kwbLEfbSArWlUSG1zu824uLLn
 S8Yt/+P8ZhVzSlRwaHf+Ubyz6qvHoqZJfd88l7PiY0W6QkEo1FF83Z8aLhAkWUp7pAyz
 meNwVqPTJqNWzf91OxArriJVLsLMUYPQiTzhBfyI3/K1GjdwBxL0MNxHUZHURphPXtMO
 jHYkBJT6XO04tBIxSQpznv2ux5L4QxvI5eNoNGondD77QNo8IzbJKWRrJOoog7SaDckS
 0ubQ==
X-Gm-Message-State: AO0yUKUH1xZg0L/nwkFUQDwRU+Q7CYzKmMlvGGL6yWMfSuRsBWNUPzgt
 OE2zPyHfq9Xumrr4XT5InCAdMw==
X-Google-Smtp-Source: AK7set8kh2kDzBB4CHJkTz1iDmV3/IKPUx0riwaparu6P77949nYB2XB727Wg3k9aIn+VVypxEti2Q==
X-Received: by 2002:ac2:5d41:0:b0:4de:ca63:b2d2 with SMTP id
 w1-20020ac25d41000000b004deca63b2d2mr2956571lfd.26.1677775204510; 
 Thu, 02 Mar 2023 08:40:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 e19-20020ac25473000000b0048a9e899693sm2211229lfn.16.2023.03.02.08.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 08:40:04 -0800 (PST)
Message-ID: <7de00f26-cc93-b549-f66e-8d1f8867f8b7@linaro.org>
Date: Thu, 2 Mar 2023 18:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v14 14/14] drm/msm/dp: set self refresh
 aware based on PSR support
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, robdclark@gmail.com, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/03/2023 18:33, Vinod Polimera wrote:
> For the PSR to kick in, self_refresh_aware has to be set.
> Initialize it based on the PSR support for the eDP interface.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

