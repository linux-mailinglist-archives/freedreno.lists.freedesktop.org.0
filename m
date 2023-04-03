Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE526D4D5D
	for <lists+freedreno@lfdr.de>; Mon,  3 Apr 2023 18:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDD810E510;
	Mon,  3 Apr 2023 16:18:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94F310E4FD
 for <freedreno@lists.freedesktop.org>; Mon,  3 Apr 2023 16:18:20 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h11so31819460lfu.8
 for <freedreno@lists.freedesktop.org>; Mon, 03 Apr 2023 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680538698;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+mXE+LsKS7w58ofo+TThv1QNk3ptIYcwRlDn4y/JXOw=;
 b=Ab2s2zc6kt+PUJGEdq78Ow/02BEc/9oD9n2Xl7cIqVo7a1xrDEwrCt67kiZYk97GsC
 F+/Y0juFg0xv0FMkANyGrYwv5v/UuA49IyqNwWAgn2LvqtNpRst1REMOmNsw7l0V9e2n
 pGSTiC+7OMRkRksOL4vyuNQHFc4BgTPGFfJKm9AsPtao/aoUhIb4/0Wo21o47wvI+Npt
 QySnsfTAsMd0X0Mx86OZfuccSzsDvg0/6Jnb5QDXzc3Bp0G7DAJUUQ8Sy4l2aZ6hGG8I
 sfeCzoa+rl8VkSrdRVRSidBvKKBnGfchDe5DK3hmgOsuORkD52v+pJvT7tIcSfltzrnn
 pzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680538698;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+mXE+LsKS7w58ofo+TThv1QNk3ptIYcwRlDn4y/JXOw=;
 b=Ga9fyacNpSie6X3YyeR8wNa+RA3lw2G8WXJPOBH6HXEcQDAQjxvAnLNY6kYGYa9OFv
 JzlOezmIebrlij6eQNJquQLrLNG5ZDCGipII3jXpds+P3COemVaMBqIBM6mLTheAcB9S
 Fk/OPBnInKlllkFeW3k0qhmkp1kz5ydFizaO6WCVlTezZfCVFDmK7yJ1Geu12ctB/tYx
 fCWm5IjklpCQDlvcPGY1pariL7tbFHNPl8AD8jKWKselzKHDTsSVQ3XFx6J0IJ9Gi2cV
 97B5wwm07GZvB/8XykmptQRsdrD25Yy77suPoMaEm0DC+g422JYwZy2u9hpsLctGsTS4
 DoTg==
X-Gm-Message-State: AAQBX9dzkX1CuG9bXBvQ4CkidwfIEJ+xVYlUU+yOhgHy7Nwcl/2u00F1
 ty5ma9UwMgWMrMWfm2+1g5E3Rw==
X-Google-Smtp-Source: AKy350bvNo7tfrCyjtYJUYqPuZYVN4n4KKpm6N6lDY1dyQfZedAAVlr9435poDXIfEBaCxiLIx6OhA==
X-Received: by 2002:a05:6512:951:b0:4e9:609f:256d with SMTP id
 u17-20020a056512095100b004e9609f256dmr9317327lft.13.1680538698581; 
 Mon, 03 Apr 2023 09:18:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u23-20020ac24c37000000b004d291dcee7fsm1842094lfq.55.2023.04.03.09.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 09:18:18 -0700 (PDT)
Message-ID: <3b41077b-3482-db89-de31-c41cf6429216@linaro.org>
Date: Mon, 3 Apr 2023 19:18:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
In-Reply-To: <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while
 in self refresh mode
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@gmail.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/03/2023 17:45, Dmitry Baryshkov wrote:
> On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>>
>> While in virtual terminal mode with PSR enabled, there will be
>> no atomic commits triggered without dirty_fb being set. This
>> will create a notion of no screen update. Allow atomic commit
>> when dirty_fb ioctl is issued, so that it can trigger a PSR exit
>> and shows update on the screen.
> 
> Will this impact non-VT workloads? If I remember correctly, we added
> dirty_fb handling to prevent the framework from limiting the page
> flips to vblank events (in DSI video mode).

Actually, this is kind of stupid. If we care about the workload of this 
pipe, then it is being updated, which means it is not in SR mode, 
self_refresh_active = false.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>
>> Reported-by: Bjorn Andersson <andersson@kernel.org>
>> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index ab636da..96f645e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1158,6 +1158,9 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>>          struct drm_crtc *crtc = cstate->crtc;
>>          struct drm_encoder *encoder;
>>
>> +       if (cstate->self_refresh_active)
>> +               return true;
>> +
>>          drm_for_each_encoder_mask (encoder, crtc->dev, cstate->encoder_mask) {
>>                  if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
>>                          return true;
>> --
>> 2.7.4
>>
> 
> 

-- 
With best wishes
Dmitry

