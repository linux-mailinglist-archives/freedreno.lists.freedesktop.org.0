Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D035B31F6
	for <lists+freedreno@lfdr.de>; Fri,  9 Sep 2022 10:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE8C10E58A;
	Fri,  9 Sep 2022 08:41:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7006C10E58A
 for <freedreno@lists.freedesktop.org>; Fri,  9 Sep 2022 08:41:05 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bn9so983288ljb.6
 for <freedreno@lists.freedesktop.org>; Fri, 09 Sep 2022 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=XYf9OC4lap9TDnElghyPNu9PXxrwVFlx/lkpv3HxAMs=;
 b=EjxBHJDnJwzoSYhTo8J4tAB17yMr4WmwDRMKBnVxB+usuYdnAUi6kZsIElQ0E5LBSE
 AdH4T/UaH7zY45A8iwkDiPS/lpVD92TrHG9JX/dzaXDsaNu4m9ClpJO3mX87/7Mpdplu
 WxAGUw4E9jNwuxHfCmE9Kl9+k1DZxkfPm01Z5rB6JN/V1skmoNWlVXfrh+eqdl/gFf8n
 gnWAODE8SpGUIvvxWd+W293oUs08/LLLdzB5YHYgrnT98tE1z23VHMvelj+qJB+/yh12
 AfwfjcYVuE/nGRXZZaCdIYn9Ey6pZ0lAWGWhhNxarzfGifJ/QrzGNSfAOyYv/O4bKY39
 GiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=XYf9OC4lap9TDnElghyPNu9PXxrwVFlx/lkpv3HxAMs=;
 b=LTILpnzQLm4jS0mglvWVdSxCgItdClGGJcv/5L/4vRfnwtg5azMcHOxZyewEoa+BZB
 +eJXXs83VLI1ntuSRorOpnsUA5CYZAyCp0I70BjId8TEb260DqYMcEfYcnNgkmeTP0We
 Vah5C5qtDUDmFuYG/nSoXIYuiJX7jQWeK0LAMXr91bBuu3QKvqjpC4+8fN+uWu7w2qDW
 pjCAzzHibfEIkHgMCA6IFaLPQqmnfDkf/+7VpIO5O7e77UazhAcvUUoYNqKu05BI26eu
 k8hsG1xqBaXmfFxQhx/ZoIHbxQwqfxkGa/Hu01SbtjMnu1Adqwyg2+DdLrJb8nC+yflD
 3ygw==
X-Gm-Message-State: ACgBeo2RSX4DNAwLSTvvOCeDyRdW1SFfaSy4EP3rU/R0kBLNP1PKLGrV
 RSG553hLCixgVd2cXFq4m584Hw==
X-Google-Smtp-Source: AA6agR7th6IcpkIF1sflOabwBqTiFcwUvT2tQzGy67Fmd+p14SID6U7XW7Si/bkyWLQAP/jO2w3pfw==
X-Received: by 2002:a2e:8058:0:b0:26a:d0be:ada6 with SMTP id
 p24-20020a2e8058000000b0026ad0beada6mr2930401ljg.43.1662712863780; 
 Fri, 09 Sep 2022 01:41:03 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512314200b004946a38be45sm194831lfi.50.2022.09.09.01.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:41:03 -0700 (PDT)
Message-ID: <6a911260-93a3-0e0e-eff4-095ae5a7ea7a@linaro.org>
Date: Fri, 9 Sep 2022 10:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <3961088c-d090-6986-491b-7976f5339ac8@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3961088c-d090-6986-491b-7976f5339ac8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 0/3] Limit pluggable display modes
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 robdclark@gmail.com, seanpaul@chromium.org, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/09/2022 20:05, Dmitry Baryshkov wrote:
> 
> On 30/08/2022 06:33, Abhinav Kumar wrote:
>> As reported on https://gitlab.freedesktop.org/drm/msm/-/issues/17, currently
>> there is no mechanism to limit the display output to the pluggable displays
>> and it lets users connect any monitor on any chipset based device.
>>
>> This can lead to undefined behavior because lets say the display
>> advertises an unsupported pixel clock as its preferred resolution, then
>> the end-user can experience undefined behavior such as black screen,
>> crash or an underrun.
>>
>> The capabilities of every chipset are advertised in the product
>> specification for both on-device displays and pluggable displays.
> 
> After discussing this privately, it was agreed that there are two kinds 
> of issues here:
>   - filtering the modes which can not be handled by the DPU/DSI/DP 
> hardware pieces themselves
> 
>   - filtering the modes which can not be handled by the external 
> limitations (e.g. the bridge not being able to drive this mode, the pcb 
> routing of data lanes being unable to sustain the rate, the connector 
> being the limit, etc).
> 
> Krzysztof, I'd like to ask your advice if adding a properly like 
> `max-link-frequency' sounds like a good idea? The video-interfaces.yaml 
> bindings already has the `link-frequencies' property, but it is an array 
> of discrete frequencies supported by the link in the graph. In our case 
> the list of frequencies is more or less continuous, with max (and min) 

I would just use existing link-frequencies for min-max. Your binding
would need to clarify the difference against video-interfaces.

> values. Also, can it be added to the final device in the chain (e.g. 
> hdmi/dp/vga connectors) or should it be added to the endpoint graph nodes?

The same as existing usage of video-interfaces, so the endpoints?


Best regards,
Krzysztof
