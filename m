Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071B661B12
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 00:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A454110E21F;
	Sun,  8 Jan 2023 23:28:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E49B10E21F
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 23:28:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu8so10498665lfb.4
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 15:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KIsq8NVVyedclvJ2/XWOxpWQLEh8o3CbTJXgORDdywU=;
 b=oNJ3x8eV3NMgIDcVKEpJn+tM/5y4L8vG+py1oFoBD/TCen0sZKz6Dh4UqSlhcrvZnI
 AdqnYfz1hdZjFDg/tV1P+7sYXKYgddGHPZi1iLszLThZ7vZY9pCHVds2dGC9em23ZOhB
 4kqZN9hg6War5MxUkQoWXQGATUl8+LjCc/HWMlzqZcB27wHSKA7g9SVbprpD2oGHrGnc
 JbJ1mWZl7HxvhWGH8Wpw/J8O9nAcr5IKkGA2DE8tMaNEurPJojwknIKMlv2mflnkmuJ5
 EFZoPW0aVvvHWQxi9ZBBsVCHiue+lejyv3f5EaEiUr8AXEJwR+NlRjHm6g19eTCelUzG
 khLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KIsq8NVVyedclvJ2/XWOxpWQLEh8o3CbTJXgORDdywU=;
 b=FQCyGpq8a+ty06JvIlfcagwJRz+EiAJcj5HKwxLo7R0E/SGp8UtPubWQNMyrxiRDY+
 0b2ve8Rfj1jmARdn5Twf+c9gkLcdNpA02FudCQXBoD9T7EeWT0nrFKkJeS5jEynczmsM
 jybbMONM7y/a3/xgba4DZbMSpZjbrnNJZera1rEQy5MePGLczhcmjwBh3XFOMj1+o1mv
 MVBMsN1/Lm9OOnwgsG+M7q75xPhI19FAGRQdrE5Ba+aWIAip1Ghu70SSTBntWu7W82Oc
 CbbMriKKCJITPSJW/oHNHVBP6SHSO3S5YUHVj9mcraXt1seZ8GG9xw6nkfpcJ8PSAm99
 /JjQ==
X-Gm-Message-State: AFqh2kpYDSh65W/Di7N0iDwRbaFYy+Hd0Xsvx31RlNY72T0bYF7hSutF
 sFJXuMdlqszlKFOgf/NM+oOUQQ==
X-Google-Smtp-Source: AMrXdXuOoCHYc+VVKADDEPthewwQ51Jiw3IvFSdxn1f7+OqFWy4jlL3F7bHh4J2Svmrhl0gnwdckGw==
X-Received: by 2002:a05:6512:1597:b0:4b6:f4bb:e53f with SMTP id
 bp23-20020a056512159700b004b6f4bbe53fmr19491215lfb.60.1673220533735; 
 Sun, 08 Jan 2023 15:28:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o14-20020ac2494e000000b004cc6ce1de69sm1277890lfi.42.2023.01.08.15.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:28:53 -0800 (PST)
Message-ID: <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
Date: Mon, 9 Jan 2023 01:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, David Airlie <airlied@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 Daniel Vetter <daniel@ffwll.ch>, Drew Davenport <ddavenport@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/12/2022 01:19, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks) remain NULL but will still be returned out of
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
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

I think the patch is not fully correct. Please check resource 
availability during allocation. I wouldn't expect an error from 
get_assigned_resources because of resource exhaustion.

-- 
With best wishes
Dmitry

