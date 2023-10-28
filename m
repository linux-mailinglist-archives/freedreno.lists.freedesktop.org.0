Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4F07DA494
	for <lists+freedreno@lfdr.de>; Sat, 28 Oct 2023 03:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF4F10EAA6;
	Sat, 28 Oct 2023 01:16:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4010EAA1
 for <freedreno@lists.freedesktop.org>; Sat, 28 Oct 2023 01:16:52 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-da2b9211dc0so143778276.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Oct 2023 18:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698455812; x=1699060612; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YYOGSzc5gVhC61nl8UkhLbfPjbeXVie5I0ZyNVFICnw=;
 b=DrEmOQsJMH0jKaRkks8Oa5oeUCXBRJV91lqa9WYwapC1DbF0tG+TpgC0/thnRgDkBZ
 yomU24Xnqu74VgqwLNRR6Z5S+ldw/ttlZiUZQBIFWNqtJzSsJNrmVkxdvMlC2CoO2rex
 zA3zTlb0Yyv3PyA2eti9XTTifSKCyAwmYsgMVqLRT6s0GWjFQxVPdESL8U3UcRAaF/ih
 lRktrR/w7hiXfzT99/2dQ574PYHbZ+T+G4c8P5a8qCYKNEjgsdEjt1AsudNKUfbnJoqV
 0fxRi0vEEFiuy2Gzu6BLyrPKBz9fTrl+HKc2d1cI4tpzKNsHuy55HjFRbthFNrbqLixB
 5hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698455812; x=1699060612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YYOGSzc5gVhC61nl8UkhLbfPjbeXVie5I0ZyNVFICnw=;
 b=b17tKuRbynPVB3VCeKEQMurO1Y/ekkOQ/r/nVTbRMW6ihoVBXLM9tSkqamngS3sz+1
 pMN95YbMBnF1Fk2Qv5u1NMkxf99g/4pEHZmk3qn4VDuNGw5I64lovyndbzx/5r55XSdv
 3u0V59ewKeladR2HPMRT1GnB1kcWsCai0cvyKr+dIC74NGOcnBHN0vmUS55B3LuaDnoS
 3gAeDihS+d1PER+UgzGaeKwxXya9sZMb/NMiXCK3rOb0W12SzzLoKtog3zwkHTYGJnIt
 +2oFDvonjjwMVBD8OjB3x50yUG2Xi4kXpT+ijXVfA2A1H9nVAcv0ZkauULehO2frfq9Q
 8+ZQ==
X-Gm-Message-State: AOJu0YzeW40gzNtPDF9vkEWM/QnwHT7dlUaOiE1+6uGMJH2BDUUINm5W
 zISf3xcPs8xCse76MsjnMpFUDGNVt0pmtRLzJ+fxOw==
X-Google-Smtp-Source: AGHT+IEB3TSQlXZiiMkMFKwFsa+wSKRdof4CP2GWjs5xlZAPeKKsclBTSDJH5mSHR1MJbJSXDKE/F6VBpGTFf3auWrs=
X-Received: by 2002:a25:a292:0:b0:da0:5775:fd77 with SMTP id
 c18-20020a25a292000000b00da05775fd77mr3817290ybi.63.1698455811663; Fri, 27
 Oct 2023 18:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194537.408922-1-robdclark@gmail.com>
In-Reply-To: <20231027194537.408922-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 28 Oct 2023 04:16:40 +0300
Message-ID: <CAA8EJpoOHqzQBESqjxCh4DHztJrsBQ5gKtkj++jYTAYEds9Ocg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/gem: Add metadata
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 22:45, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The EXT_external_objects extension is a bit awkward as it doesn't pass
> explicit modifiers, leaving the importer to guess with incomplete
> information.  In the case of vk (turnip) exporting and gl (freedreno)
> importing, the "OPTIMAL_TILING_EXT" layout depends on VkImageCreateInfo
> flags (among other things), which the importer does not know.  Which
> unfortunately leaves us with the need for a metadata back-channel.
>
> The contents of the metadata are defined by userspace.  The
> EXT_external_objects extension is only required to work between
> compatible versions of gl and vk drivers, as defined by device and
> driver UUIDs.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 59 +++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_gem.h |  4 +++
>  include/uapi/drm/msm_drm.h    |  2 ++
>  3 files changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b61ccea05327..8fe2677ea37a 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -37,9 +37,10 @@
>   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
>   * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
>   * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
> + * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
>   */
>  #define MSM_VERSION_MAJOR      1
> -#define MSM_VERSION_MINOR      10
> +#define MSM_VERSION_MINOR      12
>  #define MSM_VERSION_PATCHLEVEL 0
>
>  static void msm_deinit_vram(struct drm_device *ddev);
> @@ -566,6 +567,8 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                 break;
>         case MSM_INFO_SET_NAME:
>         case MSM_INFO_GET_NAME:
> +       case MSM_INFO_SET_METADATA:
> +       case MSM_INFO_GET_METADATA:
>                 break;
>         default:
>                 return -EINVAL;
> @@ -618,7 +621,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                 break;
>         case MSM_INFO_GET_NAME:
>                 if (args->value && (args->len < strlen(msm_obj->name))) {
> -                       ret = -EINVAL;
> +                       ret = -ETOOSMALL;

This is unrelated and it also slightly changes user interface, so it
IMO should come as a separate commit/

>                         break;
>                 }
>                 args->len = strlen(msm_obj->name);
> @@ -627,6 +630,58 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                                          msm_obj->name, args->len))
>                                 ret = -EFAULT;
>                 }
> +               break;
> +       case MSM_INFO_SET_METADATA:
> +               /* Impose a moderate upper bound on metadata size: */
> +               if (args->len > 128) {
> +                       ret = -EOVERFLOW;
> +                       break;
> +               }
> +
> +               ret = msm_gem_lock_interruptible(obj);
> +               if (ret)
> +                       break;
> +
> +               msm_obj->metadata =
> +                       krealloc(msm_obj->metadata, args->len, GFP_KERNEL);
> +               msm_obj->metadata_size = args->len;
> +
> +               if (copy_from_user(msm_obj->metadata, u64_to_user_ptr(args->value),
> +                                  args->len)) {
> +                       msm_obj->metadata_size = 0;
> +                       ret = -EFAULT;
> +               }
> +
> +               msm_gem_unlock(obj);
> +
> +               break;
> +       case MSM_INFO_GET_METADATA:
> +               if (!args->value) {
> +                       /*
> +                        * Querying the size is inherently racey, but
> +                        * EXT_external_objects expects the app to confirm
> +                        * via device and driver UUIDs that the exporter and
> +                        * importer versions match.  All we can do from the
> +                        * kernel side is check the length under obj lock
> +                        * when userspace tries to retrieve the metadata
> +                        */
> +                       args->len = msm_obj->metadata_size;
> +                       break;
> +               }
> +
> +               ret = msm_gem_lock_interruptible(obj);
> +               if (ret)
> +                       break;
> +
> +               if (args->len < msm_obj->metadata_size) {
> +                       ret = -ETOOSMALL;
> +               } else if (copy_to_user(u64_to_user_ptr(args->value),
> +                                       msm_obj->metadata, args->len)) {
> +                       ret = -EFAULT;
> +               }

Doesn't checkpwatch warn here about extra curly brackets?

> +
> +               msm_gem_unlock(obj);
> +
>                 break;
>         }
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 7f34263048a3..8d414b072c29 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -109,6 +109,10 @@ struct msm_gem_object {
>
>         char name[32]; /* Identifier to print for the debugfs files */
>
> +       /* userspace metadata backchannel */
> +       void *metadata;
> +       u32 metadata_size;
> +
>         /**
>          * pin_count: Number of times the pages are pinned
>          *
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 6c34272a13fd..6f2a7ad04aa4 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -139,6 +139,8 @@ struct drm_msm_gem_new {
>  #define MSM_INFO_GET_NAME      0x03   /* get debug name, returned by pointer */
>  #define MSM_INFO_SET_IOVA      0x04   /* set the iova, passed by value */
>  #define MSM_INFO_GET_FLAGS     0x05   /* get the MSM_BO_x flags */
> +#define MSM_INFO_SET_METADATA  0x06   /* set userspace metadata */
> +#define MSM_INFO_GET_METADATA  0x07   /* get userspace metadata */
>
>  struct drm_msm_gem_info {
>         __u32 handle;         /* in */
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
