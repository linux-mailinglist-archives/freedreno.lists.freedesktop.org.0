Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56749671005
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 02:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0237E10E62C;
	Wed, 18 Jan 2023 01:30:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FBE10E62C
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 01:30:23 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id vm8so79670195ejc.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 17:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZsCFqOrG564I8qOCCNQEkJcGVuvtlZxy5WMlNbN2xTQ=;
 b=J/iw0UUSt0Hxy+ZF7az331KZS8tNT51v8K0+HIEnf/j3/rgclEK3DeD5k631Ylnnh6
 IImUR2u+k689o7Vk1hKFLO6XUSmkaUJN917cvkwHXG+2h37tPUY9rZImOwfW6KFELLse
 pWQzIYSB5rCpLuwKIib3hGv6AtMXQfF8I97TlpgiHuZF9VNrCX5PVFH38j3LR5lHnSqT
 zVSEBikljdLZE0m7JTpJKuUkqohd4TzbaRPPBrRbFsXb2SFrfI9LzBNLG5Qyi14YnElU
 6iSkaVLDlviYqgys3zpTruqYl+snh9F3Ak/aBCCvS9qaFMyJHAb3dSq+NJx+kZAeR6G5
 hxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsCFqOrG564I8qOCCNQEkJcGVuvtlZxy5WMlNbN2xTQ=;
 b=Fc51mu2FX8KI+d6ghiDE6OOkqBxDywG91WL6WuQx/uUzncC5pAWbU/6Xavbmi1AYny
 lZNbdK5LB+RgXh2MXxgWoVXW8yndGE/nIvvAcZZNsmJm1qMXd3ZHf/bcaC/cbOP34/3e
 yGnw99H9iwSf1RY8opKymhn4nhjuYLNLw+4YXUadWDmQWbl3oehf8rxRkuRA6aCIXL2E
 /SiYAFyu2k1rf7n9zY8ozS2b7r1flS5ET0IhGLdKRgvqhlg5jlPNAh4h1UaUazlN7ny9
 uWkKGzFjyUh7j5chfTUyUrV9eYLyVrh08hFYl5YAReWXDfxShuvMsxAeJV9dLdhOReLJ
 m05Q==
X-Gm-Message-State: AFqh2krnXOwd5gav/UhyN+7FGC+eVUkVOWiJ2mZt578jf5s1sgQLK+y3
 aiIuh1zpqSfifkxPxOua38Yqkg==
X-Google-Smtp-Source: AMrXdXuNF0GjFG6ixd7G1diTN5Er9+WUrN8dZPYP7bvFYKP5CRCYSqQLOMmPTPLMSoGQT2lpuFXusg==
X-Received: by 2002:a17:906:fb16:b0:7c1:6d65:4718 with SMTP id
 lz22-20020a170906fb1600b007c16d654718mr5177733ejb.33.1674005422383; 
 Tue, 17 Jan 2023 17:30:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ky25-20020a170907779900b00877596d4eadsm110552ejc.101.2023.01.17.17.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:30:22 -0800 (PST)
Message-ID: <82ef3c2a-ef54-8c39-2266-7e3b203f92d1@linaro.org>
Date: Wed, 18 Jan 2023 03:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20230109231556.344977-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109231556.344977-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dpu: Disallow unallocated
 resources to be returned
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/01/2023 01:15, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks, until their allocation/assignment is being sanity-checked in
> "drm/msm/dpu: Reject topologies for which no DSC blocks are available")
> remain NULL but will still be returned out of
> dpu_rm_get_assigned_resources, where the caller expects to get an array
> containing num_blks valid pointers (but instead gets these NULLs).
> 
> To prevent this from happening, where null-pointer dereferences
> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> increase past NULL blocks and will print an error and break instead.
> After all, max_blks represents the static size of the maximum number of
> blocks whereas the actual amount varies per platform.
> 
> ^1: which can happen after a git rebase ended up moving additions to
> _dpu_cfg to a different struct which has the same patch context.
> 
> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> 
> Changes since v2:
> - Dropped all 7 other patches that were queued for -next;
> - Reworded error message to clarify that the requested resource should
>    have already been allocated, rather than sounding like
>    dpu_rm_get_assigned_resources is (re)allocating/(re)assigning
>    resources here;
> - This patch is now (implicitly!) based after "drm/msm/dpu: Reject
>    topologies for which no DSC blocks are available", which should make
>    it impossible to reach this condition, making it more of a safeguard
>    in case of future code changes and/or hidden issues: and is more
>    clearly conveyed in the patch message as well.
> 
> v2: https://lore.kernel.org/linux-arm-msm/20221221231943.1961117-5-marijn.suijten@somainline.org/
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

