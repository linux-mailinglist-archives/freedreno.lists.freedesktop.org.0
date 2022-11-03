Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D75617E8B
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 14:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1326210E5F6;
	Thu,  3 Nov 2022 13:57:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0663510E5F6
 for <freedreno@lists.freedesktop.org>; Thu,  3 Nov 2022 13:57:48 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id h24so1226820qta.7
 for <freedreno@lists.freedesktop.org>; Thu, 03 Nov 2022 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ivkl6noHgtHxnX4HkMC2J/JKiOsQACja2BSXGG6Zr60=;
 b=NKgDYXtDWPA0b4HED1ao/6boMXAV3OGZXjeZrS/VcwcYD/TBlPD2cZUzmHVd4KXGMr
 Zl3MlJubi7RpgMRPsZgfnAtqs4hw6A+zB6lVMtco/R4+6G6BQmCYg6bk9Pwl+FhizR8N
 LMkHSdQraUw72Q3OeHb0ck8HXtjdxA5yaJ6pSdARUR+wCnJ2h+PR9RpJthz8+1DaTriY
 UG9NL6vE3sG+dh8rJvwg6xLXznrtp1gHaVO4en3lIzlzQZLhIvlttj2uZNghySmkC3bK
 58/+e1cA12+NGJJ2dypxoA+iHOPvAW53biZeXiGJrAZTreqzH26oHXuJ4olcRwDJ+a6O
 j0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ivkl6noHgtHxnX4HkMC2J/JKiOsQACja2BSXGG6Zr60=;
 b=bC1vOSEGuC0owPnxDe2TftHjzVU2c/s/O+A+KHg6TEMSdRZV6EayjmXvJbofjb+0Ru
 Ka3K3yuMgJMPV46DWvmQ/JaVWXkAv7Hfwyq7a9aFKVQ/Cl17snFvchAkg5FgI2L5DC2c
 vas5jkDA1r7TRLffriFOXNgYr6fwDtTYfODHzsw9k1PhE3IYt3E+M3mbc2wHnen3dpcL
 6LcmP8xp8HoKMLmFBKpAp4BtTv+u4H5n0jz35tHjJARchQe/ty/ufrx4fmXsyruB1iQT
 pVpqVfiHF3sGxNY3GqtVuPuJYWx0LClx4m0/6y2mv/qLuELEOqIFR+3kUkH/UF4ps+Te
 W4mg==
X-Gm-Message-State: ACrzQf0lSTzVIdgpgwpzFvtIyoLpEBABFi/HPi/Z85POJJo2+YenwftX
 a1RK6urHxnoYzczk+uxGY04pGg==
X-Google-Smtp-Source: AMsMyM5PekZTVYkWuW+S4tREDd0YGuQ6PJTYu6qu6hX1kmnSyXtTOdVPhIHfXXJ16H0Am0bA/S2Xpg==
X-Received: by 2002:a05:622a:3d0:b0:39a:5634:eee2 with SMTP id
 k16-20020a05622a03d000b0039a5634eee2mr24806810qtx.660.1667483867178; 
 Thu, 03 Nov 2022 06:57:47 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 i19-20020ac860d3000000b003a5612c3f28sm54720qtm.56.2022.11.03.06.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 06:57:46 -0700 (PDT)
Message-ID: <6f6163f4-95ee-61d8-3442-88d1f2cfedbe@linaro.org>
Date: Thu, 3 Nov 2022 09:57:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
 <20221102231309.583587-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102231309.583587-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/8] dt-bindings: display/msm: add sm8350
 and sm8450 DSI PHYs
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

On 02/11/2022 19:13, Dmitry Baryshkov wrote:
> SM8350 and SM8450 platforms use the same driver and same bindings as the
> existing 7nm DSI PHYs. Add corresponding compatibility strings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

