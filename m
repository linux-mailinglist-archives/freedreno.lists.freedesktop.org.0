Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4C8507E9
	for <lists+freedreno@lfdr.de>; Sun, 11 Feb 2024 07:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D172710E3EF;
	Sun, 11 Feb 2024 06:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VXklGN+d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F66C10E3DB
 for <freedreno@lists.freedesktop.org>; Sun, 11 Feb 2024 06:15:43 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc6c0dc50dcso1832282276.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 22:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707632142; x=1708236942; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=trk0dkputcQ407fqLqvyMZsSbdzpr/uv3VO7AAyaZ88=;
 b=VXklGN+d+jiMA4ClSiTCiXTp9BIt1ImvfYZvVmcN1qFRyK3R8GfSkTjdZt3JA1HlvX
 weSZjnoM7rmsDgtqLfSXT7KHBP2cevLNOlOAswUQh8w8Jrj05kYzRsgre2FcOlc09tS1
 n4Y0wVy8w1KsjCLIx0GAqh5fRD1yMiSbjTkL+kdFJAO7VgsnvNHIlaIRBcW5six3yc+d
 n/w457QL6yy/Da81fqtJa0JfazAssIM3IIx6sSFAPwM32xNQW8HHZkgvCn8arYIQkVhP
 cfrJES8NbxBdU4/cPRod+1tl5KM0Va5ZjOrQl2EhInE6YZTWSDDzAL31+fL28eM6MdZq
 Dtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707632142; x=1708236942;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=trk0dkputcQ407fqLqvyMZsSbdzpr/uv3VO7AAyaZ88=;
 b=OjDzDUvyXHDLNZvMzzm4vNC64y9/7Agr4bOTeXTAdfTbydBMgx6o7eXArydQTsMzlZ
 /XSLBpOFb0exD7YOT8bkyeN47M27gURsD+/GUZTK7v84Wrmc9q+gnOfcDfGBpLWjmKvb
 Ub4cH11PvJyYNrf5xMtR7/y92eIxRQY8Xle48pnL16mvgS9sqkqmkQZ/U+ZVF6VZQUcB
 inEaUM/nEY2WXyZac7fLkZz1k8LDoK6Eklhe+QYXHqpJdoIa7gAMS+77mfYZ0IpeVdyL
 tpdC+0FnHLjopzd2Fzai0JRfK2BporySrUjw/hSxWnEjACUkOvb0+boA7zY83KHluGRo
 dn6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXxfuPlDBClv6lMTHGngUhPIzVKR7yTG1Fbz9atgoFHDRokDbsRHDOlrwu1w+mxE6YkV9ef/rfuN8+1czf9/u9/BFFZXqE61bsS9kfVdAm
X-Gm-Message-State: AOJu0YyorkJBdml8fMjG+sSKASk7/APt8mV3zU/zJTSyP8giHUHepvZM
 /s5Hi1SSbXI5m2jQ4oC6hNFAINyJtsMEVIZ0j738eYZ2gcmyelyuWt3F/9b1Q5m/Gh8wYdCI7OU
 tjaDUuCXe4RJA8U0fuampk3QnscpaVdc4h+55+A==
X-Google-Smtp-Source: AGHT+IEh0UmJTYu0DCUGecrs4dysYDET4hFznvF9X1J/6uldo3hjxrpVHwEqlkPNhr1uryxrJjpumO3UOreBEWQDHa8=
X-Received: by 2002:a5b:c0b:0:b0:dc6:ae0f:503b with SMTP id
 f11-20020a5b0c0b000000b00dc6ae0f503bmr2582622ybq.24.1707632142600; Sat, 10
 Feb 2024 22:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com>
 <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
 <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
 <CAA8EJpqE6BEvo1wwKMuSmR4a=VkGzRAuPk_Yw_imeYtTag+Hpg@mail.gmail.com>
 <2ca5624e-1cf4-9712-f8d8-6a609d95cad2@quicinc.com>
In-Reply-To: <2ca5624e-1cf4-9712-f8d8-6a609d95cad2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Feb 2024 08:15:31 +0200
Message-ID: <CAA8EJpo2UBX_N6FA2oQkkvE2AgQCfc0iETDLK1-MN87410NE_w@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 11 Feb 2024 at 06:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 2:11 PM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 23:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/10/2024 2:16 AM, Dmitry Baryshkov wrote:
> >>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>
> >>>> DP controller can be setup to operate in either SDP update flush mode or
> >>>> peripheral flush mode based on the DP controller hardware version.
> >>>>
> >>>> Starting in DP v1.2, the hardware documents require the use of
> >>>> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
> >>>>
> >>>> In-line with this guidance, lets program the DP controller to use
> >>>> peripheral flush mode starting DP v1.2
> >>>>
> >>>> Changes in v2:
> >>>>           - Use the original dp_catalog_hw_revision() function to
> >>>>             correctly check the DP HW version
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
> >>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
> >>>>    4 files changed, 21 insertions(+)
> >>>>
> >>
> >> <Snip>
> >>
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> index 2983756c125cd..6ac66532b47a4 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> @@ -102,6 +102,8 @@
> >>>>    #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
> >>>>    #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
> >>>>    #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> >>>> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
> >>>> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)
> >>>
> >>> Just one bit here, please.
> >>>
> >>
> >> hmm .... so the periph flush bits are 24:23 and we need a value of 3 to
> >> select peripheral flush which translates to 0x01800000.
> >>
> >> How do you suggest to break this up?
> >
> > Then FIELD_PREP(something_mask, 3). Otherwise it is too easy to
> > consider it to be DP_MAINLINK_FLUSH_MODE_UPDATE_SDP | BIT(24)
> >
>
> Sure, FIELD_PREP() works. I was confused when you said one bit :)

I was also confused, as I wrote, thus I thought that there are one-bit
values in this reg.

>
> >>
> >>>>    #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
> >>>>
> >>>>    #define REG_DP_STATE_CTRL                      (0x00000004)
> >>>> --
> >>>> 2.39.2
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
