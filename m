Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA02863596C
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 11:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672F410E1B7;
	Wed, 23 Nov 2022 10:15:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189E810E1F7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 10:15:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d6so27444896lfs.10
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 02:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bchWv29KUIlfhCBzeS/RlrJmepqrkZ2O36CXiGWm93Y=;
 b=xedXVArDLvIR/udrtXffNHoizqE0zg1raQB+FSllgKAqXe6q+1d2GAXlwOuTtfcCyk
 2DU1r6mJC8t65HrCaIltDw7DgxhWnt9xs10eaS3CRk8oWTLfpmPMeX+IT/TEtCxgR5ck
 0ZAUM8vPg5a5XoxblHWuF82IY7hPL30CwyxrWbxB4dLTIwxLL5yDu6nVh2kvsP/hOV51
 8V/oV7n8rZIRoAHRCy3+0c9MRwJDMCXNlk7Se9S3Z2cwQmAsLuI2/AGi11DyV14l8AOZ
 J4sO+OhW1swnFUpvzihysRxA7lpAe1fkJcvXCoVKG/6/StvaFgTTgQdTd0xr5qtmwZT5
 wHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bchWv29KUIlfhCBzeS/RlrJmepqrkZ2O36CXiGWm93Y=;
 b=0NwevOi1WQFFLBo7F5s/m3h9H1ZC287xsns6rx3VUZhSMKeaYiedJtNuw4+MYsP2t+
 bQ3OMTVBciX0StVDmZJUbjQjpSQryk0YTk3OWiTLXecrwZRKYKwmwbsyek6lQ75AzqcT
 6EHcHt/lMCrL8KI8DUdw/WGymBtWHH84r+ir4gzl5bY4Rh9oMvyoaV4+EKzqibS1Cyiu
 Lv4HtX+OjMvIfwuI8bqplnluYEZIRfhtCrW7p7D44aCNVQeMKGYfOjgEFILYKbxHYk4S
 yV+LQsnXkgeG83/wMqhC4O7RBZ4g1zfPVFp+K8eH9S2Y38aRU8npqZy8zp0tsDgZ3L5V
 sWTQ==
X-Gm-Message-State: ANoB5pn3IVklJhrS1nc2678s82+/IScgt73ReSIXlrgybFJspc3WP+7M
 o1sNDga3IriFq3cEhlJHHkdwsw==
X-Google-Smtp-Source: AA0mqf4P6Eq/wqOg5Tajs92LbSU1nWk3/3lttgoUsmyi/7LsJFhSMFkymsFaFXCg/zb856zXQtWhjg==
X-Received: by 2002:a05:6512:3cc:b0:4a2:2bac:e4fb with SMTP id
 w12-20020a05651203cc00b004a22bace4fbmr3214001lfp.297.1669198503026; 
 Wed, 23 Nov 2022 02:15:03 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 6-20020a2eb946000000b0027775fb1f6csm2152048ljs.136.2022.11.23.02.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:15:02 -0800 (PST)
Message-ID: <3f796546-f9ac-353c-9f5b-870f77726da6@linaro.org>
Date: Wed, 23 Nov 2022 11:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 01/11] dt-bindings: display/msm:
 *dpu.yaml: split required properties clauses
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> Per Krzysztof's request, move a clause requiring certain properties to
> the file where they are declared.
> 

Commit msg could be a bit more generic, without naming me (there are few
Krzysztofs), e.g.:

Require only properties declared in given schema, which makes the code a
bit more readable and easy to follow.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

