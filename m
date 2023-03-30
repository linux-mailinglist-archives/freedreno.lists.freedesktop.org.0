Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C486D0057
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 11:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D9110ED7C;
	Thu, 30 Mar 2023 09:58:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D591A10ED7E
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 09:58:10 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id f188so4288972ybb.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680170290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lM1clLMyFkv8RnfmeF0BvNOKffXMAeEtVBe3ANIN4rM=;
 b=B1SyhkzVdWGwXx5MQnwXKgJUgmsgRElhiJ/ccK5nN7O55gclBTHvjJWMbYZTrgXuY/
 XVrrY8RAOzgU33TFT+PaPJeCl9WJqhucaHVvj74vo3DjyyiaXkTudXmw+Qsc8Sd2/0hT
 VxybRcBl29YhCkdjWKPhJCkO9u3kiy3HTRzjfGmzPuoXeTAE1HOb4r4ovsXyfygfqrfw
 4d1xFf5XLXHNF17GJZE1zohRW7j6r3/fmXtzvj6VwbuPw7GldOJ74qLEQ5hn3GKDHiqw
 av3ejpM/gGs+58O37qRqnTnCRetC5oGklJR6g0D5CqTP1TaX6KKH7MPHu9scLSxpfg8T
 DqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lM1clLMyFkv8RnfmeF0BvNOKffXMAeEtVBe3ANIN4rM=;
 b=VPeqrIrsUWHZDFrz5yA1JUR5sl9C/rR6RLM+6TfQz8R8gde1YcmWmdikD3+CR7mplu
 pPpg18rmiSWaWCr8fq/HqXRhvTkXifpotQ/q4VCEP3HF3GzZ/OfJxwGn6egre6+lXuEH
 lhXsaUvPQUszwKJPrFnucJ5Cq8r3E7Dd70azRfqDLNWHTXxX5/xBCZaFry2eF4HrYMrZ
 e21p8CSbmB8s/9hFKckhpPOh2zh4NMgbHatzz5LjQMNOEX5d2qnAJboAIO4rpKNBXeUC
 cz00n/aglGnRgPdkjNMVYjiFgMLUfCnSOz09qngBD4fFfTbKzuGyaNpwBuY4d4fceVYP
 /TJQ==
X-Gm-Message-State: AAQBX9dbtOiYT6ogoYpW1sI/OrSH+utlnRI4SUjEzYOejnD1mUrvANPg
 ZKfuUkTgydK5VF9l1C4kwGYudMIsJtgfarvPw+ZcLA==
X-Google-Smtp-Source: AKy350ZvlWGvCwpr4//KI4810BMNOvHxy1rAcxCPE12M/gjQgM0PKbZ9M+wilo3JKUUgVMPf3zydkfCeJP2rPtarqxo=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr15577834ybu.9.1680170289973; Thu, 30 Mar
 2023 02:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-4-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-4-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 12:57:59 +0300
Message-ID: <CAA8EJpqa+simnPi6w-hj4J5AJaWajRUvKS=azVvi2OA1tG_zoA@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/6] drm/msm: Remove struct msm_fbdev
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, robdclark@gmail.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Remove struct msm_fbdev, which is an empty wrapper around struct
> drm_fb_helper. Use the latter directly. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index 323a79d9ef83..0985486d194b 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -18,12 +18,6 @@
>   * fbdev funcs, to implement legacy fbdev interface on top of drm driver
>   */
>
> -#define to_msm_fbdev(x) container_of(x, struct msm_fbdev, base)
> -
> -struct msm_fbdev {
> -       struct drm_fb_helper base;
> -};
> -
>  static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  {
>         struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
> @@ -129,16 +123,13 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
>  struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
> -       struct msm_fbdev *fbdev;
>         struct drm_fb_helper *helper;
>         int ret;
>
> -       fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
> -       if (!fbdev)
> +       helper = kzalloc(sizeof(*helper), GFP_KERNEL);
> +       if (!helper)
>                 return NULL;
>
> -       helper = &fbdev->base;
> -
>         drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
>
>         ret = drm_fb_helper_init(dev, helper);
> @@ -159,7 +150,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
>         drm_fb_helper_fini(helper);
>  fail:
>         drm_fb_helper_unprepare(helper);
> -       kfree(fbdev);

I think this will leak the newly created helper instance.

>         return NULL;
>  }
>
> @@ -168,7 +158,6 @@ void msm_fbdev_free(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct drm_fb_helper *helper = priv->fbdev;
>         struct drm_framebuffer *fb = helper->fb;
> -       struct msm_fbdev *fbdev;
>
>         DBG();
>
> @@ -176,8 +165,6 @@ void msm_fbdev_free(struct drm_device *dev)
>
>         drm_fb_helper_fini(helper);
>
> -       fbdev = to_msm_fbdev(priv->fbdev);
> -
>         /* this will free the backing object */
>         if (fb) {
>                 struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
> @@ -186,7 +173,7 @@ void msm_fbdev_free(struct drm_device *dev)
>         }
>
>         drm_fb_helper_unprepare(helper);
> -       kfree(fbdev);
> +       kfree(helper);
>
>         priv->fbdev = NULL;
>  }
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
