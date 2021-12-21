Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F147BE69
	for <lists+freedreno@lfdr.de>; Tue, 21 Dec 2021 11:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB8710F358;
	Tue, 21 Dec 2021 10:48:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542E810F369
 for <freedreno@lists.freedesktop.org>; Tue, 21 Dec 2021 10:48:27 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id t34so12448193qtc.7
 for <freedreno@lists.freedesktop.org>; Tue, 21 Dec 2021 02:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cVpCMMIi1tjA4OyGU3rx8gElgVfE4GySRfg8ryIMmN8=;
 b=DHZFqLHpwwECYpmpjSbAFv2g/RJz3+GU0X5y2BawrdsD77J66lM/hvG7zCuLm4XP9D
 Om/bxxHq1rH/77o3J5bQwIFROdoO/zsgpFgTwFXDIrJ07Zo3uV1EuRgSk6+SQiL/AwdN
 3mmCQCL1ewUNvC1z1SE3qIUT/vpZ6WEFR53g2sq5ob8QSmRUNYSdYE3C7XmTU4O945Db
 nRFV8gm6NBQesTjgBgqHkyd7KeXItxc1QJQ/LDYUVQXR0TEAEolCw+xA5jGTV3ud3Nb+
 0PhM72i1NCGntNKZaqImwJvM8yrA0U1mQ7xlAfx9FF69eD8ZM2FfSUxDihF3moKM0jEv
 KA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cVpCMMIi1tjA4OyGU3rx8gElgVfE4GySRfg8ryIMmN8=;
 b=RMFL3QOwo0wpy8Pubw7gtDuDbleEih7+ZWlmwcMOyDD5J8E1VxRiu7zrVLELZwaWjW
 xUdG0tb5Op1k4iY3TSqFQkxmr3wTms0NxIbZPQue9pqMAdXYaoArCG+szE8wDYoiRKam
 Kypt9Ul5fKh1/ZyfkxZmHbXQJRd6T+/cbRCmiy2N4Jfph5zm2MHEyh8Q7NGJ4G+ufE2M
 HjObPazKhkqrqURt0OUe8swZvNiGq0a0lW74mII/Tv/ZRpt4ZDX/LvMqi3esMAX4VOP8
 WtAZn7uXPAfAKq0qrfiMUzd6pPO/kNUH08fKCsn7ZoSW6SKMKSaePbeqLl74f5YIH/j9
 YilQ==
X-Gm-Message-State: AOAM533+2Y5GMCuMP0hLYYQ5hpGuydmfvBi2Mk8fzQfOUOEXe96G7xgl
 C+G+0tUnrwl6SbslrAdfFzcShZXJnZzouOsqDo8nkg==
X-Google-Smtp-Source: ABdhPJy5w19aks3xmmYqzkFSMv593adNRGFMJdwvmZYgaWKN4laOQIB1b5WBGEwlb18pBRmgHk1a22fe2/49SigiVcI=
X-Received: by 2002:a05:622a:3ca:: with SMTP id
 k10mr1644590qtx.130.1640083706051; 
 Tue, 21 Dec 2021 02:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
 <20211221101319.7980-2-jose.exposito89@gmail.com>
In-Reply-To: <20211221101319.7980-2-jose.exposito89@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 13:48:15 +0300
Message-ID: <CAA8EJppMsqot1isnMYeSWVJm4tC-PoqUDL9jwd5HJ72tca0HQQ@mail.gmail.com>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 1/3] drm/plane: Mention format_mod_supported
 in IN_FORMATS docs
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
Cc: freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 wens@csie.org, mripard@kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, maxime@cerno.tech, tzimmermann@suse.de, sean@poorly.run,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 21 Dec 2021 at 13:13, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmai=
l.com> wrote:
>
> Adding format modifiers without implementing the function
> "drm_plane_funcs.format_mod_supported" exposes an invalid IN_FORMATS
> blob with modifiers but no formats to user-space.

I think the fix should be applied to the generic code. The docs at
drm_plane.h clearly state that this callback is optional:

         * This optional hook is used for the DRM to determine if the given
         * format/modifier combination is valid for the plane. This allows =
the
         * DRM to generate the correct format bitmask (which formats apply =
to
         * which modifier), and to valdiate modifiers at atomic_check time.
         *
         * If not present, then any modifier in the plane's modifier
         * list is allowed with any of the plane's formats.

So, one should fix the core code in create_in_format_blob() to include
all combinations.

>
> This breaks the latest Weston [1]. For testing purposes, I extracted the
> affected code to a standalone program [2].
>
> Make clear in the IN_FORMATS documentation that implementing
> "format_mod_supported" is mandatory.

format_mod_supported() being optional or mandatory should be
documented in the format_mod_supported() docs, not in the IN_FORMAT
docs.

>
> [1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/ba=
ckend-drm/kms.c#L431
> [2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 82afb854141b..347571f8909a 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -126,8 +126,11 @@
>   * IN_FORMATS:
>   *     Blob property which contains the set of buffer format and modifie=
r
>   *     pairs supported by this plane. The blob is a struct
> - *     drm_format_modifier_blob. Without this property the plane doesn't
> - *     support buffers with modifiers. Userspace cannot change this prop=
erty.
> + *     drm_format_modifier_blob and the drm_plane_funcs.format_mod_suppo=
rted
> + *     function must be implemented by the driver to determine if the gi=
ven
> + *     format/modifier combination is valid for the plane. Without this =
property
> + *     the plane doesn't support buffers with modifiers. Userspace canno=
t change
> + *     this property.
>   *
>   *     Note that userspace can check the &DRM_CAP_ADDFB2_MODIFIERS drive=
r
>   *     capability for general modifier support. If this flag is set then=
 every
> --
> 2.25.1
>


--=20
With best wishes
Dmitry
