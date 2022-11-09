Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C492F622CD9
	for <lists+freedreno@lfdr.de>; Wed,  9 Nov 2022 14:52:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD73610E5D0;
	Wed,  9 Nov 2022 13:52:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADEC10E5C4
 for <freedreno@lists.freedesktop.org>; Wed,  9 Nov 2022 13:52:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ft34so10451981ejc.12
 for <freedreno@lists.freedesktop.org>; Wed, 09 Nov 2022 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2S+J1iMBr46oe55nECdK26SAa6W64ZtOEh/PbByniAU=;
 b=AZMhWxuad20lIxfAUULABl3yIgEcHVNdTApiGdmGv/ZRoE4CsXXL4K3vxKFM9e+0Uf
 ITQwbHIx4eLw8MSlJ5Zh/OwdaUiheDOSJQ50J5aNPCuK8JJKz0X4vMtEcUMIKn1LW3uH
 s+VyaVx9nlc47fG3YPUl7sJxh5+1n2b312Ivw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2S+J1iMBr46oe55nECdK26SAa6W64ZtOEh/PbByniAU=;
 b=jvllR1xUyo6gbv2q8zrB3DDaFV5NcwugzBjgZHAg2nw1NQJncc71ZqzkHni5Vx5AsG
 UVUml3CPI58Vj5zCN4PHFes1wlgSilfN39/5k+1vVGDkA0y5+lCj/E+pJ3IuQK6zE2Vu
 U3H95ZR3GFcgCzKzjOSrccKwL7/JGKECmAngSlFSqyLQPSxSuUvuPbmpKvT38VlkVFi1
 RP0zOIfpWLFk/NIQive6TQZiKPBBAT35Bea8bpjo8UwmcICBY1lWu+DkiZwLxe1sQQ1R
 jbHatjFos7gHMJuHiHwaVBon3/jm9XTgq/03GYy597GzWl+tpDfNjAwDetju0UFzOTDi
 oGrQ==
X-Gm-Message-State: ACrzQf2u2SL1ZdZWHN6XJTKc87cjoVB6lOG51KDX7dpZZpaHtcNA6mhA
 mV+z2GHSkimE89PZvz+Wa+MbXg==
X-Google-Smtp-Source: AMsMyM5cM+yUjAcRBZ6MzVFWPzKG388UhMKyFKh3eL7E58JSyMRacGE4fimWfsAwbnzEawMVN42zNw==
X-Received: by 2002:a17:907:7639:b0:79f:d1dd:2f86 with SMTP id
 jy25-20020a170907763900b0079fd1dd2f86mr57825602ejc.586.1668001941057; 
 Wed, 09 Nov 2022 05:52:21 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170906360900b00795bb7d64d8sm5937137ejb.217.2022.11.09.05.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 05:52:19 -0800 (PST)
Date: Wed, 9 Nov 2022 14:52:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Message-ID: <Y2uwjKCN4KGzm3aN@phenom.ffwll.local>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
 <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
Subject: Re: [Freedreno] [RFC PATCH 1/3] drm: Introduce color fill
 properties for drm plane
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 daniel.vetter@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 06:25:29PM +0000, Simon Ser wrote:
> On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On 29/10/2022 01:59, Jessica Zhang wrote:
> > 
> > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > drm_plane. In addition, add support for setting and getting the values
> > > of these properties.
> > > 
> > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > > represents the format of the color fill. Userspace can set enable solid
> > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > framebuffer to NULL.
> > 
> > I suppose that COLOR_FILL should override framebuffer rather than
> > requiring that FB is set to NULL. In other words, if color_filL_format
> > is non-zero, it would make sense to ignore the FB. Then one can use the
> > color_fill_format property to quickly switch between filled plane and
> > FB-backed one.
> 
> That would be inconsistent with the rest of the KMS uAPI. For instance,
> the kernel will error out if CRTC has active=0 but a connector is still
> linked to the CRTC. IOW, the current uAPI errors out if the KMS state
> is inconsistent.

So if the use-case here really is to solid-fill a plane (and not just
provide a background color for the crtc overall), then I guess we could
also extend addfb to make that happen. We've talked in the past about
propertery-fying framebuffer objects, and that would sort out this uapi
wart. And I agree the color fill vs PLANE_ID issue is a bit ugly at least.

But if the use-cases are all background color then just doing the crtc
background color would be tons simpler (and likely also easier to support
for more hardware).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
