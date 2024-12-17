Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E29F4642
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 09:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3A410E87D;
	Tue, 17 Dec 2024 08:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aOzXt2TC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D57410E874
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 08:43:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa6c0dbce1fso700307766b.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734424993; x=1735029793; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hiu9HwglMl8R0iD4e34J2UKryh0tlFaMmUgSj2KvQ5I=;
 b=aOzXt2TCXLORh3LcqlFrPJJeEwgWN76d2H70qPMTWB9LIsScfvZscoWs3wHYauFr5w
 3F+gsAe8ey63reCeTSfH4QdHKVZ8qTX2uhAMq0ZbcwcXDWpWMsH5shqSMTSCllLX9lLI
 DyUMcNIWSnIjilscKtNNgvjAM7IS8xA4gnVtnnRnOC14s4bS6zj+zlqdxcToEJ3FgMjV
 AFKbJREFuhBhaOm7SjkRIqa5c3dd4ZBq+sv9ULSya42hDw6FAFppAepsiobD3N19vHJZ
 spzI8duxKAqKC5cKvM2pkVNhpOEfjZaXCRJNDKJciMkuHs1JHHdW8aWFn01AVpmMvWkM
 Davw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734424993; x=1735029793;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hiu9HwglMl8R0iD4e34J2UKryh0tlFaMmUgSj2KvQ5I=;
 b=gs/z+cazB+pK6qMTWmjZpAqbgf+sHDLlWdJzTkFDe5x+BF82flwbBixNlrgjhXFfDp
 CQKNMuY640R+I2YyZvHN96f5SLYSfD/4+EC7oqXeHCYvkilbE8U+0TFjY+mRn5zYfRrN
 +YMXkd5DPA/x/Gy7Lxw83hOpgjyxZLo2AKjRX1uAU5jDzHOm3fGhxC+caiBiLFlv0te7
 tMXe7jwX87u4pScb/pbEs8+IXOajbKnty/I/hmdioxweXhoHstsOZYC3grux4S7z6I7N
 rhkzuiI2AIeYuoExeylzwb2Ef18jzAMSwtBn7S3qy11AQSjAq212ETd/qMUmw32oMyfO
 eplA==
X-Gm-Message-State: AOJu0YxQ/cLjCAqP2/QcPCEuG/Ibw5/LfTGoojK25GJEHyaW6l+yG/HF
 +Nz6kTe+noDVD34y5Eh5SgZ897NM8eZd1RHa+tmgk4XfAV/bi+ADgOC7tIzd3hpPHplFv+lbJ2r
 l
X-Gm-Gg: ASbGncuoD8SnBAFTAX9a7wcCqcX51+T9pxmn6h/Ei8ERDjJGWsYJpBl2stigRoxq+Ix
 SsL5GKx26CQFSFUDQ+NRUrJeaEqWUoa9Z0wHyZZNBeiJLQVzRRdXbA0akiqVKIfoXxoEZf7fiig
 3A/JLDtvyz9NS6Qq+nSfvi44XBDTBcQwYkv6AgSD/3yRz2hXgEV327bYSMSPHVgTNFTBk5GJoHJ
 +zHfwLfqqQmRMd9fqe1KupTZNKP1RTb6LSjOAgfdEY32lx9E58+dehtYq0lKw==
X-Google-Smtp-Source: AGHT+IGrzonxMatjuG4bZaYlfOUbgqkUNaXWwwF+W6A6JMV8WxShHm27eYpccj5y0cXi8db1jI6FrA==
X-Received: by 2002:a05:6402:254e:b0:5d2:7270:6128 with SMTP id
 4fb4d7f45d1cf-5d63c3dbe25mr36464887a12.25.1734424993450; 
 Tue, 17 Dec 2024 00:43:13 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9635988dsm423372766b.125.2024.12.17.00.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 00:43:12 -0800 (PST)
Date: Tue, 17 Dec 2024 11:43:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm/dpu: add support for virtual planes
Message-ID: <960b44e7-f5d4-4b5a-af5f-cfe6bb8a20b0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Dmitry Baryshkov,

Commit 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
from Dec 15, 2024 (linux-next), leads to the following Smatch static
checker warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1062 dpu_plane_virtual_atomic_check() error: 'plane_state' dereferencing possible ERR_PTR()
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1066 dpu_plane_virtual_atomic_check() error: uninitialized symbol 'crtc_state'.

drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
    1051 static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
    1052                                           struct drm_atomic_state *state)
    1053 {
    1054         struct drm_plane_state *plane_state =
    1055                 drm_atomic_get_plane_state(state, plane);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
drm_atomic_get_plane_state() can fail.

    1056         struct drm_plane_state *old_plane_state =
    1057                 drm_atomic_get_old_plane_state(state, plane);
    1058         struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
    1059         struct drm_crtc_state *crtc_state;
    1060         int ret;
    1061 
--> 1062         if (plane_state->crtc)
                     ^^^^^^^^^^^
    1063                 crtc_state = drm_atomic_get_new_crtc_state(state,
    1064                                                            plane_state->crtc);

crtc_state isn't initialized on else path.

    1065 
    1066         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);

Presumably crtc_state isn't used, but it's still considered a bug.  It's
undefined behavior in C.

    1067         if (ret)
    1068                 return ret;
    1069 
    1070         if (!plane_state->visible) {
    1071                 /*
    1072                  * resources are freed by dpu_crtc_assign_plane_resources(),
    1073                  * but clean them here.
    1074                  */
    1075                 pstate->pipe.sspp = NULL;
    1076                 pstate->r_pipe.sspp = NULL;
    1077 
    1078                 return 0;
    1079         }
    1080 
    1081         /*
    1082          * Force resource reallocation if the format of FB or src/dst have
    1083          * changed. We might need to allocate different SSPP or SSPPs for this
    1084          * plane than the one used previously.
    1085          */
    1086         if (!old_plane_state || !old_plane_state->fb ||
    1087             old_plane_state->src_w != plane_state->src_w ||
    1088             old_plane_state->src_h != plane_state->src_h ||
    1089             old_plane_state->src_w != plane_state->src_w ||
    1090             old_plane_state->crtc_h != plane_state->crtc_h ||
    1091             msm_framebuffer_format(old_plane_state->fb) !=
    1092             msm_framebuffer_format(plane_state->fb))
    1093                 crtc_state->planes_changed = true;
    1094 
    1095         return 0;
    1096 }

regards,
dan carpenter
