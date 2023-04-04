Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556756D6F41
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 23:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1743410E7C9;
	Tue,  4 Apr 2023 21:49:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3D410E7C3
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 21:49:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y20so44179685lfj.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 14:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680644981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c9m8JcZMmWZ1S9B7I0X4OWYztsfYf55/KOOKuskJIlc=;
 b=Z4DI99E4RIjphWZMJHkO8FxQhtyyrv0FLzs52XFk/NCyBuzC3aIkbbB18/VZ0bMg+N
 74ywJTvuCPUi6M/CzGnDfV8nLhYpMZXX+4JqujjyExMaaqlqr+hoyPRnRYh34/kPmBPt
 qo7mDyk/bRvemXBO4wox7UZNCGcn5b9B1XMuC2Ho90ezrTaZ5Xq2cRuWJDzPpfVnOuyU
 mNA45YViz2w99XSWPszDS47rphCs9hsHke2IG/t1JHsHrOIHZgGWVZw+iS9YfXR1btIA
 pi0/DSsCWXAqeJaJmNqR+sIe04N3oI/H/pRpnLRtmF4JG/CxxMUGISAeoUgCEgOBWQJJ
 TLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680644981;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c9m8JcZMmWZ1S9B7I0X4OWYztsfYf55/KOOKuskJIlc=;
 b=x+FV3mdWcpyNXhkFaWdFtLH2WMQD09qBrxaANh9a8NZo4eqtL69pojl61/iCbMRkHs
 Jco4OryW5Wmq/+K6MADbBvStpGXwCEOiiEfYYlZpZVDeDOtEhyzVtuAwBUXBHJoNfx07
 bYg4Uc+8EbCwH+xpcWNWkhxYtWYbMdZ7A0RuaOvg5TUNi0+ICZPbyOpnfiZGLNXr7bmd
 pkbqQsQvMuf759Mbm0z8ajDR94h6RHCJGPbB0jsjbjG14jGNes4R/tJvgUxGY0DtrVGB
 Zriw4vazzKUtdquqLUfhpsFMHVGQ8eleEC05aIRBrahdEL0u03plZsksERF/XrM5Ej2W
 s0bA==
X-Gm-Message-State: AAQBX9dmUfSujNT0s0+L1ElKV3b83E03cSvvvvn+NoTvrlybKUqurV69
 zUfKMh2v+xMReL7SpmVJs9EyJw==
X-Google-Smtp-Source: AKy350Zf+ul31Abg44Eo9e+Yy1lnbFlwfl8KiguNoPQHOntwSsbASgV+RlHuOW80PHwf7RqxDqt39g==
X-Received: by 2002:a19:a40c:0:b0:4eb:50ba:cb06 with SMTP id
 q12-20020a19a40c000000b004eb50bacb06mr291289lfc.49.1680644981217; 
 Tue, 04 Apr 2023 14:49:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a197614000000b004db9dbe09c6sm2501436lff.89.2023.04.04.14.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 14:49:40 -0700 (PDT)
Message-ID: <55828eac-32a7-1c6c-25de-2e031ac12f49@linaro.org>
Date: Wed, 5 Apr 2023 00:49:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Tom Rix <trix@redhat.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, vladimir.lypak@gmail.com
References: <20230404185329.1925964-1-trix@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404185329.1925964-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: set varaiable msm8x76_config
 storage-class-specifier to static
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/04/2023 21:53, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c:658:26: warning: symbol
>    'msm8x76_config' was not declared. Should it be static?
> 
> This variable is only used in one file so should be static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

