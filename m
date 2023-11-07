Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5911E7E363F
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 09:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2DA891E1;
	Tue,  7 Nov 2023 08:04:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50483891E1
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 08:04:54 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28120aa1c24so1017323a91.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Nov 2023 00:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699344294; x=1699949094; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wb/64/FQH2poghN90ipHGCrkBVktlirodfaTWRsiXb4=;
 b=g8TU0djFLWoZW7Idj4SXMKYUOXXx+FrXwa3l2BO4Bmj666Fj/wW7qF+qoQRoKq5tk0
 U9tMyPFpJYS630v4V0ZFK0ckJK0dndYC9M2hukCY20lBgfBmV+7eYpMazt8+1tOkVDKp
 HhzZ+ZbGnE8BCraJrPfxQl2f6X1XQvQ1fF404BNUr7q6Mac0Gy0Y+Xacsh6yAZGZNhOI
 ltPbJBlDGuTyM/7uZ2C/R8tfkeluUV0aE+GyJOvaM7D8MWnbG295a8G6yMT+z20QWHS/
 +xvusMs0MY7VfY2B6+wEhf1IKWhoNNfUFw4dw/uBunMgipaWbqAkJiXeqTL5b1KoyxA6
 nU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699344294; x=1699949094;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wb/64/FQH2poghN90ipHGCrkBVktlirodfaTWRsiXb4=;
 b=QDWLR7y9zPF8cDG9TEaJOtAfH/amglDQmqVQCHrYJkGITOqufjfJviMmeGRQw6sU4t
 rry9t2BKuhWboq2ciePgzv3BTtAxu1fo0pMeaSlCsGV1s//id5u2DMqjpASwsg2jc556
 4qcF8U0Wk1pTIdTuB6tYNEL2/po3rYDx49Gx+POVik9BLUH9TrzSy/wmsFE9ZrKv7UgU
 I348XTLcY2LlZYJlcN45GT4dvhDLgIKOztTxrMJAunR8TS5N1s4NSCuqt3Ytzsu+LzDK
 H1Q7B9VD4itth3mS8PzgSa/LjWI4Kiyn3vCAxpK95AT4CaMsQSBzvHxz4+JBLW1Gn4MZ
 i1rQ==
X-Gm-Message-State: AOJu0Yy7anp5BQ16Y/eUQHmj4OgwJ07psfPhhJEW6UGN4iNkaT6I/DsX
 jDJnXtB9DJbCJd/F9ST+PnyEMBZi5XZBwAbB72JE/j//e1P/ew==
X-Google-Smtp-Source: AGHT+IEruzEAT/1hx+e1CWHSIxH0sWUfpvw42XLINyfJecOWgcck/qtsUYZiRH83+dYgyESo4OufOJ+aCdSwpY3Y4hE=
X-Received: by 2002:a17:90a:2d83:b0:280:29e8:4379 with SMTP id
 p3-20020a17090a2d8300b0028029e84379mr21267184pjd.34.1699344293408; Tue, 07
 Nov 2023 00:04:53 -0800 (PST)
MIME-Version: 1.0
References: <mailman.27501.1699314556.926.freedreno@lists.freedesktop.org>
In-Reply-To: <mailman.27501.1699314556.926.freedreno@lists.freedesktop.org>
From: Forcha Pearl <forchapearl1@gmail.com>
Date: Tue, 7 Nov 2023 09:04:41 +0100
Message-ID: <CA+_yd8qdYdWHq20aJjLr_+2BPk9fSpxhccq+F=oYkkGzDkG_Bw@mail.gmail.com>
To: freedreno@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000f5b62306098b6c74"
Subject: Re: [Freedreno] Freedreno Digest, Vol 117, Issue 10
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

--000000000000f5b62306098b6c74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello members,
I'm Forcha Pearl, a final-year Computer Science postgraduate.
I'm good at Python, C++,C and JavaScript languages and have completed a few
projects,
excited to explore open source by contributing and learning.

Could anyone kindly assist me in making my initial contribution to X.ORG
foundation by suggesting beginner-friendly issues?

On Tue, Nov 7, 2023 at 12:49=E2=80=AFAM <freedreno-request@lists.freedeskto=
p.org>
wrote:

> Send Freedreno mailing list submissions to
>         freedreno@lists.freedesktop.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.freedesktop.org/mailman/listinfo/freedreno
> or, via email, send a message with subject or body 'help' to
>         freedreno-request@lists.freedesktop.org
>
> You can reach the person managing the list at
>         freedreno-owner@lists.freedesktop.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Freedreno digest..."
>
>
> Today's Topics:
>
>    1. [PATCH v3 2/2] drm/msm/gem: Add metadata (Rob Clark)
>    2. Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
>       (Dmitry Baryshkov)
>    3. Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
>       (Abhinav Kumar)
>    4. Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block
>       (Dmitry Baryshkov)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Mon,  6 Nov 2023 10:50:26 -0800
> From: Rob Clark <robdclark@gmail.com>
> To: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
>         Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <
> daniels@collabora.com>,
>         Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
>         <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>, Abhina=
v
>         Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
> Marijn
>         Suijten <marijn.suijten@somainline.org>, David Airlie
>         <airlied@gmail.com>, linux-kernel@vger.kernel.org (open list)
> Subject: [Freedreno] [PATCH v3 2/2] drm/msm/gem: Add metadata
> Message-ID: <20231106185028.209462-3-robdclark@gmail.com>
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
> v2: add missing metadata kfree
> v3: Rework to move copy_from/to_user out from under gem obj lock
>     to avoid angering lockdep about deadlocks against fs-reclaim
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Note, I dropped Dmitry's r-b on this version because it was a bit of
> a re-write of the original patch.
>
>  drivers/gpu/drm/msm/msm_drv.c | 92 ++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gem.c |  1 +
>  drivers/gpu/drm/msm/msm_gem.h |  4 ++
>  include/uapi/drm/msm_drm.h    |  2 +
>  4 files changed, 98 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.=
c
> index 781db689fb16..c05c27a70c34 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -49,9 +49,10 @@
>   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
>   * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
>   * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
> + * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
>   */
>  #define MSM_VERSION_MAJOR      1
> -#define MSM_VERSION_MINOR      11
> +#define MSM_VERSION_MINOR      12
>  #define MSM_VERSION_PATCHLEVEL 0
>
>  static void msm_deinit_vram(struct drm_device *ddev);
> @@ -822,6 +823,85 @@ static int msm_ioctl_gem_info_set_iova(struct
> drm_device *dev,
>         return msm_gem_set_iova(obj, ctx->aspace, iova);
>  }
>
> +static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,
> +                                          __user void *metadata,
> +                                          u32 metadata_size)
> +{
> +       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> +       void *buf;
> +       int ret;
> +
> +       /* Impose a moderate upper bound on metadata size: */
> +       if (metadata_size > 128) {
> +               return -EOVERFLOW;
> +       }
> +
> +       /* Use a temporary buf to keep copy_from_user() outside of gem ob=
j
> lock: */
> +       buf =3D memdup_user(metadata, metadata_size);
> +       if (IS_ERR(buf))
> +               return PTR_ERR(buf);
> +
> +       ret =3D msm_gem_lock_interruptible(obj);
> +       if (ret)
> +               goto out;
> +
> +       msm_obj->metadata =3D
> +               krealloc(msm_obj->metadata, metadata_size, GFP_KERNEL);
> +       msm_obj->metadata_size =3D metadata_size;
> +       memcpy(msm_obj->metadata, buf, metadata_size);
> +
> +       msm_gem_unlock(obj);
> +
> +out:
> +       kfree(buf);
> +
> +       return ret;
> +}
> +
> +static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
> +                                          __user void *metadata,
> +                                          u32 *metadata_size)
> +{
> +       struct msm_gem_object *msm_obj =3D to_msm_bo(obj);
> +       void *buf;
> +       int ret, len;
> +
> +       if (!metadata) {
> +               /*
> +                * Querying the size is inherently racey, but
> +                * EXT_external_objects expects the app to confirm
> +                * via device and driver UUIDs that the exporter and
> +                * importer versions match.  All we can do from the
> +                * kernel side is check the length under obj lock
> +                * when userspace tries to retrieve the metadata
> +                */
> +               *metadata_size =3D msm_obj->metadata_size;
> +               return 0;
> +       }
> +
> +       ret =3D msm_gem_lock_interruptible(obj);
> +       if (ret)
> +               return ret;
> +
> +       /* Avoid copy_to_user() under gem obj lock: */
> +       len =3D msm_obj->metadata_size;
> +       buf =3D kmemdup(msm_obj->metadata, len, GFP_KERNEL);
> +
> +       msm_gem_unlock(obj);
> +
> +       if (*metadata_size < len) {
> +               ret =3D -ETOOSMALL;
> +       } else if (copy_to_user(metadata, buf, len)) {
> +               ret =3D -EFAULT;
> +       } else {
> +               *metadata_size =3D len;
> +       }
> +
> +       kfree(buf);
> +
> +       return 0;
> +}
> +
>  static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                 struct drm_file *file)
>  {
> @@ -844,6 +924,8 @@ static int msm_ioctl_gem_info(struct drm_device *dev,
> void *data,
>                 break;
>         case MSM_INFO_SET_NAME:
>         case MSM_INFO_GET_NAME:
> +       case MSM_INFO_SET_METADATA:
> +       case MSM_INFO_GET_METADATA:
>                 break;
>         default:
>                 return -EINVAL;
> @@ -906,6 +988,14 @@ static int msm_ioctl_gem_info(struct drm_device *dev=
,
> void *data,
>                                 ret =3D -EFAULT;
>                 }
>                 break;
> +       case MSM_INFO_SET_METADATA:
> +               ret =3D msm_ioctl_gem_info_set_metadata(
> +                       obj, u64_to_user_ptr(args->value), args->len);
> +               break;
> +       case MSM_INFO_GET_METADATA:
> +               ret =3D msm_ioctl_gem_info_get_metadata(
> +                       obj, u64_to_user_ptr(args->value), &args->len);
> +               break;
>         }
>
>         drm_gem_object_put(obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 1113e6b2ec8e..175ee4ab8a6f 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1058,6 +1058,7 @@ static void msm_gem_free_object(struct
> drm_gem_object *obj)
>
>         drm_gem_object_release(obj);
>
> +       kfree(msm_obj->metadata);
>         kfree(msm_obj);
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.=
h
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
>  #define MSM_INFO_GET_NAME      0x03   /* get debug name, returned by
> pointer */
>  #define MSM_INFO_SET_IOVA      0x04   /* set the iova, passed by value *=
/
>  #define MSM_INFO_GET_FLAGS     0x05   /* get the MSM_BO_x flags */
> +#define MSM_INFO_SET_METADATA  0x06   /* set userspace metadata */
> +#define MSM_INFO_GET_METADATA  0x07   /* get userspace metadata */
>
>  struct drm_msm_gem_info {
>         __u32 handle;         /* in */
> --
> 2.41.0
>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 7 Nov 2023 00:11:47 +0200
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
>         Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd
>         <swboyd@chromium.org>,  David Airlie <airlied@gmail.com>, Daniel
>         Vetter <daniel@ffwll.ch>,  Bjorn Andersson <andersson@kernel.org>=
,
>         linux-arm-msm@vger.kernel.org,  dri-devel@lists.freedesktop.org,
>         freedreno@lists.freedesktop.org
> Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: correct clk bit for WB2
>         block
> Message-ID:
>         <CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=3D-
> k58Mwg@mail.gmail.com>
> Content-Type: text/plain; charset=3D"UTF-8"
>
> On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com>
> wrote:
> >
> > Sorry for the delay in getting back on this. There was quite a bit of
> > history digging I had to do myself to give a certain response.
> >
> >
> > On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> > > On sc7280 there are two clk bits for WB2: control and status. While
> > > programming the VBIF params of WB, the driver should be toggling the
> > > former bit, while the sc7280_mdp struct lists the latter one.
> > >
> >
> > No, this is not correct. Both are control bits. But for the context of
> > where this is being used today, that is setting the VBIF OT limit, we
> > should be using the VBIF_CLI one. So the below change itself is correct
> > but not the commit text.
>
> Maybe you can update dt bindings for the SDE driver? Because they
> clearly speak about the control and status bits.
>
> >
> > We need to make the same change on sm8250 WB2 as well as this register
> > is present there too. In fact, anything >=3Dmsm8994 for setting VBIF OT
> > for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
> > (offset 0x2bc).
> >
> > For anything >=3Dsm8550, we need to use WB_2_CLK_CTRL present within th=
e
> > WB block and not the one in the top.
> >
> > Hence for this change, we can do below:
> >
> > -> update the commit text to indicate both are control bits but for the
> > vbif ot context we should using the corrected one
> > -> if you can also add sm8250 in the same change i can ack it and pick
> it up
> >
> > Have you re-validated WB with this change? If not, let me know I shall
> > while picking this up for -fixes.
>
> No, I haven't validated this on sc7280. I'll try this on sm8250 and
> then I'll send v2.
>
> >
> > > Correct that to ensure proper programming sequence for WB2 on sc7280.
> > >
> > > Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > > index 3b5061c4402a..9195cb996f44 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > > @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp =3D {
> > >               [DPU_CLK_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off =
=3D 8 },
> > >               [DPU_CLK_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off =
=3D 8 },
> > >               [DPU_CLK_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off =
=3D 8 },
> > > -             [DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x3b8, .bit_off =
=3D 24 },
> > > +             [DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x2bc, .bit_off =
=3D 16 },
> > >       },
> > >   };
> > >
>
>
>
> --
> With best wishes
> Dmitry
>
>
> ------------------------------
>
> Message: 3
> Date: Mon, 6 Nov 2023 15:30:32 -0800
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
>         Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd
>         <swboyd@chromium.org>, David Airlie <airlied@gmail.com>, Daniel
> Vetter
>         <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
>         <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org
> >,
>         <freedreno@lists.freedesktop.org>
> Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: correct clk bit for WB2
>         block
> Message-ID: <1ac30bfd-86d9-8186-1aee-f201b8ff4370@quicinc.com>
> Content-Type: text/plain; charset=3D"UTF-8"; format=3Dflowed
>
>
>
> On 11/6/2023 2:11 PM, Dmitry Baryshkov wrote:
> > On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com>
> wrote:
> >>
> >> Sorry for the delay in getting back on this. There was quite a bit of
> >> history digging I had to do myself to give a certain response.
> >>
> >>
> >> On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> >>> On sc7280 there are two clk bits for WB2: control and status. While
> >>> programming the VBIF params of WB, the driver should be toggling the
> >>> former bit, while the sc7280_mdp struct lists the latter one.
> >>>
> >>
> >> No, this is not correct. Both are control bits. But for the context of
> >> where this is being used today, that is setting the VBIF OT limit, we
> >> should be using the VBIF_CLI one. So the below change itself is correc=
t
> >> but not the commit text.
> >
> > Maybe you can update dt bindings for the SDE driver? Because they
> > clearly speak about the control and status bits.
> >
>
> There is nothing to update here if we both are referring to the same
> entries in the dt bindings.
>
> qcom,sde-wb-clk-status =3D <0x3bc 20>;
>
> the clk status is indeed bit 20 of 0x3bc.
>
> What we have before your patch was bit 24 of 0x3b8 which was indeed
> clk_ctl bit for wb2. But the only issue was it was not the vbif_cli one.
>
> So we are talking about two different registers?
>
> >>
> >> We need to make the same change on sm8250 WB2 as well as this register
> >> is present there too. In fact, anything >=3Dmsm8994 for setting VBIF O=
T
> >> for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
> >> (offset 0x2bc).
> >>
> >> For anything >=3Dsm8550, we need to use WB_2_CLK_CTRL present within t=
he
> >> WB block and not the one in the top.
> >>
> >> Hence for this change, we can do below:
> >>
> >> -> update the commit text to indicate both are control bits but for th=
e
> >> vbif ot context we should using the corrected one
> >> -> if you can also add sm8250 in the same change i can ack it and pick
> it up
> >>
> >> Have you re-validated WB with this change? If not, let me know I shall
> >> while picking this up for -fixes.
> >
> > No, I haven't validated this on sc7280. I'll try this on sm8250 and
> > then I'll send v2.
> >
> >>
> >>> Correct that to ensure proper programming sequence for WB2 on sc7280.
> >>>
> >>> Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> index 3b5061c4402a..9195cb996f44 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> >>> @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp =3D {
> >>>                [DPU_CLK_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off=
 =3D 8
> },
> >>>                [DPU_CLK_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off=
 =3D 8
> },
> >>>                [DPU_CLK_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off=
 =3D 8
> },
> >>> -             [DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x3b8, .bit_off =
=3D 24 },
> >>> +             [DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x2bc, .bit_off =
=3D 16 },
> >>>        },
> >>>    };
> >>>
> >
> >
> >
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 7 Nov 2023 01:49:03 +0200
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
>         Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd
>         <swboyd@chromium.org>,  David Airlie <airlied@gmail.com>, Daniel
>         Vetter <daniel@ffwll.ch>,  Bjorn Andersson <andersson@kernel.org>=
,
>         linux-arm-msm@vger.kernel.org,  dri-devel@lists.freedesktop.org,
>         freedreno@lists.freedesktop.org
> Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: correct clk bit for WB2
>         block
> Message-ID:
>         <
> CAA8EJppY0V20rF1kV-b8X2xuCQ6ZHy_+0YGp5s6b_Srvq-LLNg@mail.gmail.com>
> Content-Type: text/plain; charset=3D"UTF-8"
>
> On Tue, 7 Nov 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com>
> wrote:
> >
> >
> >
> > On 11/6/2023 2:11 PM, Dmitry Baryshkov wrote:
> > > On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar <quic_abhinavk@quicinc.com=
>
> wrote:
> > >>
> > >> Sorry for the delay in getting back on this. There was quite a bit o=
f
> > >> history digging I had to do myself to give a certain response.
> > >>
> > >>
> > >> On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:
> > >>> On sc7280 there are two clk bits for WB2: control and status. While
> > >>> programming the VBIF params of WB, the driver should be toggling th=
e
> > >>> former bit, while the sc7280_mdp struct lists the latter one.
> > >>>
> > >>
> > >> No, this is not correct. Both are control bits. But for the context =
of
> > >> where this is being used today, that is setting the VBIF OT limit, w=
e
> > >> should be using the VBIF_CLI one. So the below change itself is
> correct
> > >> but not the commit text.
> > >
> > > Maybe you can update dt bindings for the SDE driver? Because they
> > > clearly speak about the control and status bits.
> > >
> >
> > There is nothing to update here if we both are referring to the same
> > entries in the dt bindings.
> >
> > qcom,sde-wb-clk-status =3D <0x3bc 20>;
> >
> > the clk status is indeed bit 20 of 0x3bc.
> >
> > What we have before your patch was bit 24 of 0x3b8 which was indeed
> > clk_ctl bit for wb2. But the only issue was it was not the vbif_cli one=
.
> >
> > So we are talking about two different registers?
>
> Ah, excuse me then, I didn't notice 24 vs 20.
>
> >
> > >>
> > >> We need to make the same change on sm8250 WB2 as well as this regist=
er
> > >> is present there too. In fact, anything >=3Dmsm8994 for setting VBIF=
 OT
> > >> for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2
> > >> (offset 0x2bc).
> > >>
> > >> For anything >=3Dsm8550, we need to use WB_2_CLK_CTRL present within=
 the
> > >> WB block and not the one in the top.
> > >>
> > >> Hence for this change, we can do below:
> > >>
> > >> -> update the commit text to indicate both are control bits but for
> the
> > >> vbif ot context we should using the corrected one
> > >> -> if you can also add sm8250 in the same change i can ack it and
> pick it up
> > >>
> > >> Have you re-validated WB with this change? If not, let me know I sha=
ll
> > >> while picking this up for -fixes.
> > >
> > > No, I haven't validated this on sc7280. I'll try this on sm8250 and
> > > then I'll send v2.
> > >
> > >>
> > >>> Correct that to ensure proper programming sequence for WB2 on sc728=
0.
> > >>>
> > >>> Fixes: 3ce166380567 ("drm/msm/dpu: add writeback support for sc7280=
")
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>> ---
> > >>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 2 +-
> > >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > >>> index 3b5061c4402a..9195cb996f44 100644
> > >>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > >>> @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp =3D {
> > >>>                [DPU_CLK_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_o=
ff =3D
> 8 },
> > >>>                [DPU_CLK_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_o=
ff =3D
> 8 },
> > >>>                [DPU_CLK_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_o=
ff =3D
> 8 },
> > >>> -             [DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x3b8, .bit_off=
 =3D 24
> },
> > >>> +             [DPU_CLK_CTRL_WB2] =3D { .reg_off =3D 0x2bc, .bit_off=
 =3D 16
> },
> > >>>        },
> > >>>    };
> > >>>
> > >
> > >
> > >
>
>
>
> --
> With best wishes
> Dmitry
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
>
>
> ------------------------------
>
> End of Freedreno Digest, Vol 117, Issue 10
> ******************************************
>

--000000000000f5b62306098b6c74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:large;color:rgb(68,68,68)"><font f=
ace=3D"arial, sans-serif">Hello members,=C2=A0</font></div><div style=3D"fo=
nt-size:large;color:rgb(68,68,68)"><font face=3D"arial, sans-serif">I&#39;m=
 Forcha Pearl, a final-year Computer Science postgraduate.=C2=A0</font></di=
v><div style=3D"font-size:large;color:rgb(68,68,68)"><font face=3D"arial, s=
ans-serif">I&#39;m good at Python, C++,C and JavaScript languages and have =
completed a few projects,<br>excited to=C2=A0explore open source by contrib=
uting and learning.=C2=A0<br><br></font></div><div style=3D"font-size:large=
;color:rgb(68,68,68)"><font face=3D"arial, sans-serif">Could anyone kindly =
assist me in making my initial contribution to <a href=3D"http://X.ORG">X.O=
RG</a> foundation by suggesting beginner-friendly=C2=A0issues?</font></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Nov 7, 2023 at 12:49=E2=80=AFAM &lt;<a href=3D"mailto:freedreno-req=
uest@lists.freedesktop.org">freedreno-request@lists.freedesktop.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Send Fre=
edreno mailing list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:freedreno@lists.freedesktop.o=
rg" target=3D"_blank">freedreno@lists.freedesktop.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.freedesktop.org/mailma=
n/listinfo/freedreno" rel=3D"noreferrer" target=3D"_blank">https://lists.fr=
eedesktop.org/mailman/listinfo/freedreno</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:freedreno-request@lists.freed=
esktop.org" target=3D"_blank">freedreno-request@lists.freedesktop.org</a><b=
r>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:freedreno-owner@lists.freedes=
ktop.org" target=3D"_blank">freedreno-owner@lists.freedesktop.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Freedreno digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. [PATCH v3 2/2] drm/msm/gem: Add metadata (Rob Clark)<br>
=C2=A0 =C2=A02. Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block<br>
=C2=A0 =C2=A0 =C2=A0 (Dmitry Baryshkov)<br>
=C2=A0 =C2=A03. Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block<br>
=C2=A0 =C2=A0 =C2=A0 (Abhinav Kumar)<br>
=C2=A0 =C2=A04. Re: [PATCH] drm/msm/dpu: correct clk bit for WB2 block<br>
=C2=A0 =C2=A0 =C2=A0 (Dmitry Baryshkov)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Mon,=C2=A0 6 Nov 2023 10:50:26 -0800<br>
From: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank=
">robdclark@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dr=
i-devel@lists.freedesktop.org</a><br>
Cc: <a href=3D"mailto:freedreno@lists.freedesktop.org" target=3D"_blank">fr=
eedreno@lists.freedesktop.org</a>, <a href=3D"mailto:linux-arm-msm@vger.ker=
nel.org" target=3D"_blank">linux-arm-msm@vger.kernel.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwl=
l.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt;, Daniel Stone &lt;<a href=
=3D"mailto:daniels@collabora.com" target=3D"_blank">daniels@collabora.com</=
a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.b=
aryshkov@linaro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;,=
 Rob Clark<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:robdclark@chromium.org" t=
arget=3D"_blank">robdclark@chromium.org</a>&gt;, Rob Clark &lt;<a href=3D"m=
ailto:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt;, A=
bhinav<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Kumar &lt;<a href=3D"mailto:quic_abhinavk@quici=
nc.com" target=3D"_blank">quic_abhinavk@quicinc.com</a>&gt;, Sean Paul &lt;=
sean@poorly.run&gt;, Marijn<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Suijten &lt;<a href=3D"mailto:marijn.suijten@so=
mainline.org" target=3D"_blank">marijn.suijten@somainline.org</a>&gt;, Davi=
d Airlie<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:airlied@gmail.com" target=
=3D"_blank">airlied@gmail.com</a>&gt;, <a href=3D"mailto:linux-kernel@vger.=
kernel.org" target=3D"_blank">linux-kernel@vger.kernel.org</a> (open list)<=
br>
Subject: [Freedreno] [PATCH v3 2/2] drm/msm/gem: Add metadata<br>
Message-ID: &lt;<a href=3D"mailto:20231106185028.209462-3-robdclark@gmail.c=
om" target=3D"_blank">20231106185028.209462-3-robdclark@gmail.com</a>&gt;<b=
r>
<br>
From: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" target=3D"_bl=
ank">robdclark@chromium.org</a>&gt;<br>
<br>
The EXT_external_objects extension is a bit awkward as it doesn&#39;t pass<=
br>
explicit modifiers, leaving the importer to guess with incomplete<br>
information.=C2=A0 In the case of vk (turnip) exporting and gl (freedreno)<=
br>
importing, the &quot;OPTIMAL_TILING_EXT&quot; layout depends on VkImageCrea=
teInfo<br>
flags (among other things), which the importer does not know.=C2=A0 Which<b=
r>
unfortunately leaves us with the need for a metadata back-channel.<br>
<br>
The contents of the metadata are defined by userspace.=C2=A0 The<br>
EXT_external_objects extension is only required to work between<br>
compatible versions of gl and vk drivers, as defined by device and<br>
driver UUIDs.<br>
<br>
v2: add missing metadata kfree<br>
v3: Rework to move copy_from/to_user out from under gem obj lock<br>
=C2=A0 =C2=A0 to avoid angering lockdep about deadlocks against fs-reclaim<=
br>
<br>
Signed-off-by: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" targ=
et=3D"_blank">robdclark@chromium.org</a>&gt;<br>
---<br>
Note, I dropped Dmitry&#39;s r-b on this version because it was a bit of<br=
>
a re-write of the original patch.<br>
<br>
=C2=A0drivers/gpu/drm/msm/msm_drv.c | 92 ++++++++++++++++++++++++++++++++++=
-<br>
=C2=A0drivers/gpu/drm/msm/msm_gem.c |=C2=A0 1 +<br>
=C2=A0drivers/gpu/drm/msm/msm_gem.h |=C2=A0 4 ++<br>
=C2=A0include/uapi/drm/msm_drm.h=C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A04 files changed, 98 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c<=
br>
index 781db689fb16..c05c27a70c34 100644<br>
--- a/drivers/gpu/drm/msm/msm_drv.c<br>
+++ b/drivers/gpu/drm/msm/msm_drv.c<br>
@@ -49,9 +49,10 @@<br>
=C2=A0 * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN<br>
=C2=A0 * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT<br>
=C2=A0 * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)<b=
r>
+ * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA<br>
=C2=A0 */<br>
=C2=A0#define MSM_VERSION_MAJOR=C2=A0 =C2=A0 =C2=A0 1<br>
-#define MSM_VERSION_MINOR=C2=A0 =C2=A0 =C2=A0 11<br>
+#define MSM_VERSION_MINOR=C2=A0 =C2=A0 =C2=A0 12<br>
=C2=A0#define MSM_VERSION_PATCHLEVEL 0<br>
<br>
=C2=A0static void msm_deinit_vram(struct drm_device *ddev);<br>
@@ -822,6 +823,85 @@ static int msm_ioctl_gem_info_set_iova(struct drm_devi=
ce *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return msm_gem_set_iova(obj, ctx-&gt;aspace, io=
va);<br>
=C2=A0}<br>
<br>
+static int msm_ioctl_gem_info_set_metadata(struct drm_gem_object *obj,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=
_user void *metadata,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
32 metadata_size)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_gem_object *msm_obj =3D to_msm_bo(ob=
j);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Impose a moderate upper bound on metadata si=
ze: */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (metadata_size &gt; 128) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOVERFLOW;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use a temporary buf to keep copy_from_user()=
 outside of gem obj lock: */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D memdup_user(metadata, metadata_size);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(buf))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(buf)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D msm_gem_lock_interruptible(obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msm_obj-&gt;metadata =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0krealloc(msm_obj-&g=
t;metadata, metadata_size, GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msm_obj-&gt;metadata_size =3D metadata_size;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(msm_obj-&gt;metadata, buf, metadata_size=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msm_gem_unlock(obj);<br>
+<br>
+out:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _=
_user void *metadata,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
32 *metadata_size)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_gem_object *msm_obj =3D to_msm_bo(ob=
j);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, len;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!metadata) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Querying the siz=
e is inherently racey, but<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * EXT_external_obj=
ects expects the app to confirm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * via device and d=
river UUIDs that the exporter and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * importer version=
s match.=C2=A0 All we can do from the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * kernel side is c=
heck the length under obj lock<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * when userspace t=
ries to retrieve the metadata<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*metadata_size =3D =
msm_obj-&gt;metadata_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D msm_gem_lock_interruptible(obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Avoid copy_to_user() under gem obj lock: */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D msm_obj-&gt;metadata_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D kmemdup(msm_obj-&gt;metadata, len, GFP_=
KERNEL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0msm_gem_unlock(obj);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*metadata_size &lt; len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ETOOSMALL;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (copy_to_user(metadata, buf, len)) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAULT;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*metadata_size =3D =
len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static int msm_ioctl_gem_info(struct drm_device *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file *fi=
le)<br>
=C2=A0{<br>
@@ -844,6 +924,8 @@ static int msm_ioctl_gem_info(struct drm_device *dev, v=
oid *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case MSM_INFO_SET_NAME:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case MSM_INFO_GET_NAME:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case MSM_INFO_SET_METADATA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case MSM_INFO_GET_METADATA:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
@@ -906,6 +988,14 @@ static int msm_ioctl_gem_info(struct drm_device *dev, =
void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EFAULT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case MSM_INFO_SET_METADATA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D msm_ioctl_g=
em_info_set_metadata(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0obj, u64_to_user_ptr(args-&gt;value), args-&gt;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case MSM_INFO_GET_METADATA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D msm_ioctl_g=
em_info_get_metadata(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0obj, u64_to_user_ptr(args-&gt;value), &amp;args-&gt;len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_gem_object_put(obj);<br>
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c<=
br>
index 1113e6b2ec8e..175ee4ab8a6f 100644<br>
--- a/drivers/gpu/drm/msm/msm_gem.c<br>
+++ b/drivers/gpu/drm/msm/msm_gem.c<br>
@@ -1058,6 +1058,7 @@ static void msm_gem_free_object(struct drm_gem_object=
 *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_gem_object_release(obj);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(msm_obj-&gt;metadata);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(msm_obj);<br>
=C2=A0}<br>
<br>
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h<=
br>
index 7f34263048a3..8d414b072c29 100644<br>
--- a/drivers/gpu/drm/msm/msm_gem.h<br>
+++ b/drivers/gpu/drm/msm/msm_gem.h<br>
@@ -109,6 +109,10 @@ struct msm_gem_object {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char name[32]; /* Identifier to print for the d=
ebugfs files */<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* userspace metadata backchannel */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *metadata;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 metadata_size;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* pin_count: Number of times the pages ar=
e pinned<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h<br>
index 6c34272a13fd..6f2a7ad04aa4 100644<br>
--- a/include/uapi/drm/msm_drm.h<br>
+++ b/include/uapi/drm/msm_drm.h<br>
@@ -139,6 +139,8 @@ struct drm_msm_gem_new {<br>
=C2=A0#define MSM_INFO_GET_NAME=C2=A0 =C2=A0 =C2=A0 0x03=C2=A0 =C2=A0/* get=
 debug name, returned by pointer */<br>
=C2=A0#define MSM_INFO_SET_IOVA=C2=A0 =C2=A0 =C2=A0 0x04=C2=A0 =C2=A0/* set=
 the iova, passed by value */<br>
=C2=A0#define MSM_INFO_GET_FLAGS=C2=A0 =C2=A0 =C2=A00x05=C2=A0 =C2=A0/* get=
 the MSM_BO_x flags */<br>
+#define MSM_INFO_SET_METADATA=C2=A0 0x06=C2=A0 =C2=A0/* set userspace meta=
data */<br>
+#define MSM_INFO_GET_METADATA=C2=A0 0x07=C2=A0 =C2=A0/* get userspace meta=
data */<br>
<br>
=C2=A0struct drm_msm_gem_info {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 handle;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* in */<br>
-- <br>
2.41.0<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Tue, 7 Nov 2023 00:11:47 +0200<br>
From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org" t=
arget=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
To: Abhinav Kumar &lt;<a href=3D"mailto:quic_abhinavk@quicinc.com" target=
=3D"_blank">quic_abhinavk@quicinc.com</a>&gt;<br>
Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">=
robdclark@gmail.com</a>&gt;, Sean Paul &lt;sean@poorly.run&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Marijn Suijten &lt;<a href=3D"mailto:marijn.sui=
jten@somainline.org" target=3D"_blank">marijn.suijten@somainline.org</a>&gt=
;, Stephen Boyd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:swboyd@chromium.org" targ=
et=3D"_blank">swboyd@chromium.org</a>&gt;,=C2=A0 David Airlie &lt;<a href=
=3D"mailto:airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt;, =
Daniel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" t=
arget=3D"_blank">daniel@ffwll.ch</a>&gt;,=C2=A0 Bjorn Andersson &lt;<a href=
=3D"mailto:andersson@kernel.org" target=3D"_blank">andersson@kernel.org</a>=
&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-arm-msm@vger.kernel.org=
" target=3D"_blank">linux-arm-msm@vger.kernel.org</a>,=C2=A0 <a href=3D"mai=
lto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-devel@lists.free=
desktop.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:freedreno@lists.freedesktop.o=
rg" target=3D"_blank">freedreno@lists.freedesktop.org</a><br>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: correct clk bit for WB2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 block<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;CAA8EJprpBy6UhtScRkFS24TgKevBOb9nVBFCqPhEof=
=3D-<a href=3D"mailto:k58Mwg@mail.gmail.com" target=3D"_blank">k58Mwg@mail.=
gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar &lt;<a href=3D"mailto:quic_abhin=
avk@quicinc.com" target=3D"_blank">quic_abhinavk@quicinc.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Sorry for the delay in getting back on this. There was quite a bit of<=
br>
&gt; history digging I had to do myself to give a certain response.<br>
&gt;<br>
&gt;<br>
&gt; On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:<br>
&gt; &gt; On sc7280 there are two clk bits for WB2: control and status. Whi=
le<br>
&gt; &gt; programming the VBIF params of WB, the driver should be toggling =
the<br>
&gt; &gt; former bit, while the sc7280_mdp struct lists the latter one.<br>
&gt; &gt;<br>
&gt;<br>
&gt; No, this is not correct. Both are control bits. But for the context of=
<br>
&gt; where this is being used today, that is setting the VBIF OT limit, we<=
br>
&gt; should be using the VBIF_CLI one. So the below change itself is correc=
t<br>
&gt; but not the commit text.<br>
<br>
Maybe you can update dt bindings for the SDE driver? Because they<br>
clearly speak about the control and status bits.<br>
<br>
&gt;<br>
&gt; We need to make the same change on sm8250 WB2 as well as this register=
<br>
&gt; is present there too. In fact, anything &gt;=3Dmsm8994 for setting VBI=
F OT<br>
&gt; for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2<br>
&gt; (offset 0x2bc).<br>
&gt;<br>
&gt; For anything &gt;=3Dsm8550, we need to use WB_2_CLK_CTRL present withi=
n the<br>
&gt; WB block and not the one in the top.<br>
&gt;<br>
&gt; Hence for this change, we can do below:<br>
&gt;<br>
&gt; -&gt; update the commit text to indicate both are control bits but for=
 the<br>
&gt; vbif ot context we should using the corrected one<br>
&gt; -&gt; if you can also add sm8250 in the same change i can ack it and p=
ick it up<br>
&gt;<br>
&gt; Have you re-validated WB with this change? If not, let me know I shall=
<br>
&gt; while picking this up for -fixes.<br>
<br>
No, I haven&#39;t validated this on sc7280. I&#39;ll try this on sm8250 and=
<br>
then I&#39;ll send v2.<br>
<br>
&gt;<br>
&gt; &gt; Correct that to ensure proper programming sequence for WB2 on sc7=
280.<br>
&gt; &gt;<br>
&gt; &gt; Fixes: 3ce166380567 (&quot;drm/msm/dpu: add writeback support for=
 sc7280&quot;)<br>
&gt; &gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.bary=
shkov@linaro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.=
h | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280=
.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h<br>
&gt; &gt; index 3b5061c4402a..9195cb996f44 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h<br>
&gt; &gt; @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp =3D =
{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK_CT=
RL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off =3D 8 },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK_CT=
RL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off =3D 8 },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK_CT=
RL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off =3D 8 },<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK_CTRL_WB=
2] =3D { .reg_off =3D 0x3b8, .bit_off =3D 24 },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK_CTRL_WB=
2] =3D { .reg_off =3D 0x2bc, .bit_off =3D 16 },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt;=C2=A0 =C2=A0};<br>
&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Mon, 6 Nov 2023 15:30:32 -0800<br>
From: Abhinav Kumar &lt;<a href=3D"mailto:quic_abhinavk@quicinc.com" target=
=3D"_blank">quic_abhinavk@quicinc.com</a>&gt;<br>
To: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org" tar=
get=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">=
robdclark@gmail.com</a>&gt;, Sean Paul &lt;sean@poorly.run&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Marijn Suijten &lt;<a href=3D"mailto:marijn.sui=
jten@somainline.org" target=3D"_blank">marijn.suijten@somainline.org</a>&gt=
;, Stephen Boyd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:swboyd@chromium.org" targ=
et=3D"_blank">swboyd@chromium.org</a>&gt;, David Airlie &lt;<a href=3D"mail=
to:airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt;, Daniel V=
etter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:daniel@ffwll.ch" target=
=3D"_blank">daniel@ffwll.ch</a>&gt;, Bjorn Andersson &lt;<a href=3D"mailto:=
andersson@kernel.org" target=3D"_blank">andersson@kernel.org</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:linux-arm-msm@vger.kernel=
.org" target=3D"_blank">linux-arm-msm@vger.kernel.org</a>&gt;, &lt;<a href=
=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-devel@lis=
ts.freedesktop.org</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:freedreno@lists.freedeskt=
op.org" target=3D"_blank">freedreno@lists.freedesktop.org</a>&gt;<br>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: correct clk bit for WB2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 block<br>
Message-ID: &lt;<a href=3D"mailto:1ac30bfd-86d9-8186-1aee-f201b8ff4370@quic=
inc.com" target=3D"_blank">1ac30bfd-86d9-8186-1aee-f201b8ff4370@quicinc.com=
</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;; format=3Dflowed<br>
<br>
<br>
<br>
On 11/6/2023 2:11 PM, Dmitry Baryshkov wrote:<br>
&gt; On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar &lt;<a href=3D"mailto:quic_=
abhinavk@quicinc.com" target=3D"_blank">quic_abhinavk@quicinc.com</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; Sorry for the delay in getting back on this. There was quite a bit=
 of<br>
&gt;&gt; history digging I had to do myself to give a certain response.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:<br>
&gt;&gt;&gt; On sc7280 there are two clk bits for WB2: control and status. =
While<br>
&gt;&gt;&gt; programming the VBIF params of WB, the driver should be toggli=
ng the<br>
&gt;&gt;&gt; former bit, while the sc7280_mdp struct lists the latter one.<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; No, this is not correct. Both are control bits. But for the contex=
t of<br>
&gt;&gt; where this is being used today, that is setting the VBIF OT limit,=
 we<br>
&gt;&gt; should be using the VBIF_CLI one. So the below change itself is co=
rrect<br>
&gt;&gt; but not the commit text.<br>
&gt; <br>
&gt; Maybe you can update dt bindings for the SDE driver? Because they<br>
&gt; clearly speak about the control and status bits.<br>
&gt; <br>
<br>
There is nothing to update here if we both are referring to the same <br>
entries in the dt bindings.<br>
<br>
qcom,sde-wb-clk-status =3D &lt;0x3bc 20&gt;;<br>
<br>
the clk status is indeed bit 20 of 0x3bc.<br>
<br>
What we have before your patch was bit 24 of 0x3b8 which was indeed <br>
clk_ctl bit for wb2. But the only issue was it was not the vbif_cli one.<br=
>
<br>
So we are talking about two different registers?<br>
<br>
&gt;&gt;<br>
&gt;&gt; We need to make the same change on sm8250 WB2 as well as this regi=
ster<br>
&gt;&gt; is present there too. In fact, anything &gt;=3Dmsm8994 for setting=
 VBIF OT<br>
&gt;&gt; for WB2 we should be using VBIF_CLI bits of register MDP_CLK_CTRL2=
<br>
&gt;&gt; (offset 0x2bc).<br>
&gt;&gt;<br>
&gt;&gt; For anything &gt;=3Dsm8550, we need to use WB_2_CLK_CTRL present w=
ithin the<br>
&gt;&gt; WB block and not the one in the top.<br>
&gt;&gt;<br>
&gt;&gt; Hence for this change, we can do below:<br>
&gt;&gt;<br>
&gt;&gt; -&gt; update the commit text to indicate both are control bits but=
 for the<br>
&gt;&gt; vbif ot context we should using the corrected one<br>
&gt;&gt; -&gt; if you can also add sm8250 in the same change i can ack it a=
nd pick it up<br>
&gt;&gt;<br>
&gt;&gt; Have you re-validated WB with this change? If not, let me know I s=
hall<br>
&gt;&gt; while picking this up for -fixes.<br>
&gt; <br>
&gt; No, I haven&#39;t validated this on sc7280. I&#39;ll try this on sm825=
0 and<br>
&gt; then I&#39;ll send v2.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt; Correct that to ensure proper programming sequence for WB2 on =
sc7280.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Fixes: 3ce166380567 (&quot;drm/msm/dpu: add writeback support =
for sc7280&quot;)<br>
&gt;&gt;&gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.b=
aryshkov@linaro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<=
br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7=
280.h | 2 +-<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7=
280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h<br>
&gt;&gt;&gt; index 3b5061c4402a..9195cb996f44 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h<b=
r>
&gt;&gt;&gt; +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h<b=
r>
&gt;&gt;&gt; @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_mdp =
=3D {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [DPU_CL=
K_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off =3D 8 },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [DPU_CL=
K_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off =3D 8 },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [DPU_CL=
K_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off =3D 8 },<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK_CTRL=
_WB2] =3D { .reg_off =3D 0x3b8, .bit_off =3D 24 },<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK_CTRL=
_WB2] =3D { .reg_off =3D 0x2bc, .bit_off =3D 16 },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 };<br>
&gt;&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Tue, 7 Nov 2023 01:49:03 +0200<br>
From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org" t=
arget=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
To: Abhinav Kumar &lt;<a href=3D"mailto:quic_abhinavk@quicinc.com" target=
=3D"_blank">quic_abhinavk@quicinc.com</a>&gt;<br>
Cc: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">=
robdclark@gmail.com</a>&gt;, Sean Paul &lt;sean@poorly.run&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Marijn Suijten &lt;<a href=3D"mailto:marijn.sui=
jten@somainline.org" target=3D"_blank">marijn.suijten@somainline.org</a>&gt=
;, Stephen Boyd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:swboyd@chromium.org" targ=
et=3D"_blank">swboyd@chromium.org</a>&gt;,=C2=A0 David Airlie &lt;<a href=
=3D"mailto:airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt;, =
Daniel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" t=
arget=3D"_blank">daniel@ffwll.ch</a>&gt;,=C2=A0 Bjorn Andersson &lt;<a href=
=3D"mailto:andersson@kernel.org" target=3D"_blank">andersson@kernel.org</a>=
&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-arm-msm@vger.kernel.org=
" target=3D"_blank">linux-arm-msm@vger.kernel.org</a>,=C2=A0 <a href=3D"mai=
lto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-devel@lists.free=
desktop.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:freedreno@lists.freedesktop.o=
rg" target=3D"_blank">freedreno@lists.freedesktop.org</a><br>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: correct clk bit for WB2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 block<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:CAA8EJppY0V20rF1kV-b8X2xu=
CQ6ZHy_%2B0YGp5s6b_Srvq-LLNg@mail.gmail.com" target=3D"_blank">CAA8EJppY0V2=
0rF1kV-b8X2xuCQ6ZHy_+0YGp5s6b_Srvq-LLNg@mail.gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
On Tue, 7 Nov 2023 at 01:30, Abhinav Kumar &lt;<a href=3D"mailto:quic_abhin=
avk@quicinc.com" target=3D"_blank">quic_abhinavk@quicinc.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 11/6/2023 2:11 PM, Dmitry Baryshkov wrote:<br>
&gt; &gt; On Mon, 6 Nov 2023 at 20:39, Abhinav Kumar &lt;<a href=3D"mailto:=
quic_abhinavk@quicinc.com" target=3D"_blank">quic_abhinavk@quicinc.com</a>&=
gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Sorry for the delay in getting back on this. There was quite =
a bit of<br>
&gt; &gt;&gt; history digging I had to do myself to give a certain response=
.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 10/9/2023 10:11 AM, Dmitry Baryshkov wrote:<br>
&gt; &gt;&gt;&gt; On sc7280 there are two clk bits for WB2: control and sta=
tus. While<br>
&gt; &gt;&gt;&gt; programming the VBIF params of WB, the driver should be t=
oggling the<br>
&gt; &gt;&gt;&gt; former bit, while the sc7280_mdp struct lists the latter =
one.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; No, this is not correct. Both are control bits. But for the c=
ontext of<br>
&gt; &gt;&gt; where this is being used today, that is setting the VBIF OT l=
imit, we<br>
&gt; &gt;&gt; should be using the VBIF_CLI one. So the below change itself =
is correct<br>
&gt; &gt;&gt; but not the commit text.<br>
&gt; &gt;<br>
&gt; &gt; Maybe you can update dt bindings for the SDE driver? Because they=
<br>
&gt; &gt; clearly speak about the control and status bits.<br>
&gt; &gt;<br>
&gt;<br>
&gt; There is nothing to update here if we both are referring to the same<b=
r>
&gt; entries in the dt bindings.<br>
&gt;<br>
&gt; qcom,sde-wb-clk-status =3D &lt;0x3bc 20&gt;;<br>
&gt;<br>
&gt; the clk status is indeed bit 20 of 0x3bc.<br>
&gt;<br>
&gt; What we have before your patch was bit 24 of 0x3b8 which was indeed<br=
>
&gt; clk_ctl bit for wb2. But the only issue was it was not the vbif_cli on=
e.<br>
&gt;<br>
&gt; So we are talking about two different registers?<br>
<br>
Ah, excuse me then, I didn&#39;t notice 24 vs 20.<br>
<br>
&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; We need to make the same change on sm8250 WB2 as well as this=
 register<br>
&gt; &gt;&gt; is present there too. In fact, anything &gt;=3Dmsm8994 for se=
tting VBIF OT<br>
&gt; &gt;&gt; for WB2 we should be using VBIF_CLI bits of register MDP_CLK_=
CTRL2<br>
&gt; &gt;&gt; (offset 0x2bc).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For anything &gt;=3Dsm8550, we need to use WB_2_CLK_CTRL pres=
ent within the<br>
&gt; &gt;&gt; WB block and not the one in the top.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hence for this change, we can do below:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -&gt; update the commit text to indicate both are control bit=
s but for the<br>
&gt; &gt;&gt; vbif ot context we should using the corrected one<br>
&gt; &gt;&gt; -&gt; if you can also add sm8250 in the same change i can ack=
 it and pick it up<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Have you re-validated WB with this change? If not, let me kno=
w I shall<br>
&gt; &gt;&gt; while picking this up for -fixes.<br>
&gt; &gt;<br>
&gt; &gt; No, I haven&#39;t validated this on sc7280. I&#39;ll try this on =
sm8250 and<br>
&gt; &gt; then I&#39;ll send v2.<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt; Correct that to ensure proper programming sequence for WB=
2 on sc7280.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Fixes: 3ce166380567 (&quot;drm/msm/dpu: add writeback sup=
port for sc7280&quot;)<br>
&gt; &gt;&gt;&gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmi=
try.baryshkov@linaro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>=
&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_=
2_sc7280.h | 2 +-<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-=
)<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_=
2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h<br>
&gt; &gt;&gt;&gt; index 3b5061c4402a..9195cb996f44 100644<br>
&gt; &gt;&gt;&gt; --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc728=
0.h<br>
&gt; &gt;&gt;&gt; +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc728=
0.h<br>
&gt; &gt;&gt;&gt; @@ -25,7 +25,7 @@ static const struct dpu_mdp_cfg sc7280_=
mdp =3D {<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [D=
PU_CLK_CTRL_DMA0] =3D { .reg_off =3D 0x2ac, .bit_off =3D 8 },<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [D=
PU_CLK_CTRL_DMA1] =3D { .reg_off =3D 0x2b4, .bit_off =3D 8 },<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [D=
PU_CLK_CTRL_DMA2] =3D { .reg_off =3D 0x2c4, .bit_off =3D 8 },<br>
&gt; &gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK=
_CTRL_WB2] =3D { .reg_off =3D 0x3b8, .bit_off =3D 24 },<br>
&gt; &gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DPU_CLK=
_CTRL_WB2] =3D { .reg_off =3D 0x2bc, .bit_off =3D 16 },<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 };<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
_______________________________________________<br>
Freedreno mailing list<br>
<a href=3D"mailto:Freedreno@lists.freedesktop.org" target=3D"_blank">Freedr=
eno@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/freedreno" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/freedreno</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Freedreno Digest, Vol 117, Issue 10<br>
******************************************<br>
</blockquote></div>

--000000000000f5b62306098b6c74--
