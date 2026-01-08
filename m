Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DD5D04405
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 17:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1228910E798;
	Thu,  8 Jan 2026 16:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="XlJ+ejb/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260F10E790
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 16:16:06 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so1726494f8f.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767888965; x=1768493765;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
 b=XlJ+ejb/F6Z9+Vo4ZX851LUZnHZhirxuNB3eYKtWQX7K6TRcL0Z5j9gnbfC/x+2OZt
 /k6Yz4L4YoNP+JKY7cxFfgK6A4PdSiODp4jvvI4QsIfJjmdQanCIrLqrSRXJCVorQebc
 lTbszpjX/lT8fbNQYtUH5xAEMcoxpjCLECPaClLnUqXsjH1AtD2qf03hSWyMTkWne9az
 L2Aba+du+8c9N29ZZASQHTVDrOUCmHiJON//OzhTKY4r+nj40jw5lJhPwCYMUri5TbdB
 UaHQ/TM2nOrk+itwX/WN4vfWY4V2SVwqaJcMdxULlEDRFwLU3J/UzH6VExVVsw2B5A3V
 XI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767888965; x=1768493765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6vW3/P/N4+paGKM071bgG2imOi6n7IKDgUKqaIxzm8s=;
 b=DWBOArt7f9buCNgIg7lgcVOk31cmtcXEZ9BcNnp5UVasM6Ytq77Ikx1Rl0nBE6hivS
 C3vvQ88gZnmhvg6vmtIqvJ0WZKw0AfYGH376uT7hO945LYZfTqsRwEjK0KE8KzlY12oj
 BISxIa3XlfTiNO4QtZFUzXLDejN3hyXpKp6WoxSswzfHrBwvbuuFAPNYefkgZOR56Chb
 7ueQrrERBHx/YzWEZPv1u+c71YCo4apI2jCTOEonmb0O7cpRiyzFih81dCbnXUtygTP5
 0xO0s8sKX5Yw3LOS3/4iyEp5EE06BHwXEHX/gfGruuVtwpunJY039GIoD5vui8DOWoBP
 8uuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJVPyLtKy5RKUQdNii4yWKkXz4sG/eVT+lNhQWc+w+hQVw2baSwMktBrXgrdBIjdWfbdcOchmXtBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxShQdz4ypNmprh5XN615wq85BnQHCXrcrBW2EOJOJSr34hNNY7
 /YbjqZs89gx714jnIYh95G1PfHOgd9m8pH9RqaexKFRHMFaDyXzPr7cB0p7GDv1yVp2fShEmxLG
 Kl+MrrRvSdJy/9M93uNjgErB0mwZJFK/SA9/MAV50
X-Gm-Gg: AY/fxX4WmextzRBATL+ui0HikSBzFP9XlogOXw2dac+TTWeXGaVlUwBTVSnlBZP7K40
 KMEaP+tJvzCizCtnd0BIDh+JNb8NCerG4PloSa8zRD3D2AfG5wzJatgWYyImgVTiu03uBPoJ7Ti
 N1kuftV/NSde2u4bVR9vYxBpbvFSvOam32/l4ps6e28D7e9nnzMwn1Yp7V0d6HJSSbSUDWzHAJe
 K5gX9nrtgi+C6ihKNBvpu/XwNUy0Gj3QdBtqheYWTAet45uR5CEhkbQQPeqgeVxEtYtgP3CGnr4
 61Rrj6WdZPh6lkTq2FlA33QwAsgU56AtKXsyM28VxKcKMNI12r1ifOEKWQ==
X-Google-Smtp-Source: AGHT+IFlwj7HPJoXMHh8QpN1Ab7H/UDknjidGuhXb0xbkpRQOk6X4xFeRXquaMOfNkP2YrRvaqkzOLHouDmVZwg+94c=
X-Received: by 2002:a05:6000:2311:b0:432:aa61:a06e with SMTP id
 ffacd0b85a97d-432c374fc59mr8831012f8f.32.1767888965176; Thu, 08 Jan 2026
 08:16:05 -0800 (PST)
MIME-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 17:15:52 +0100
X-Gm-Features: AQt7F2pLnnImtkMgl2KE50d4CB3AXYote1UE4JeFi6pzxph4V_uj8MRfBo1vVss
Message-ID: <CAH5fLgg36qSD7jCarKwipxTSUz4W2uiDDmL_Thqv-+8jBe5DTw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Rust GPUVM prerequisites
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 8, 2026 at 5:07=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> See v1 for the Rust code that uses these C changes.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - For this version, only the C prerequisites are included. Rust will be
>   sent as follow-up.

I forgot to fill out the changelog. Here it is:

Changes in v2:
- For this version, only the C prerequisites are included. Rust will be
  sent as follow-up.
- Add comment to drm_gpuvm_bo_destroy_not_in_lists()
- Add Fixes: tag.
- Pick up Reviewed-by tags.

> - Link to v1: https://lore.kernel.org/r/20251128-gpuvm-rust-v1-0-ebf66bf2=
34e0@google.com
>
> ---
> Alice Ryhl (3):
>       drm/gpuvm: take GEM lock inside drm_gpuvm_bo_obtain_prealloc()
>       drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and staged mode
>       drm/gpuvm: use const for drm_gpuva_op_* ptrs
>
>  drivers/gpu/drm/drm_gpuvm.c            | 91 ++++++++++++++++++++++++----=
------
>  drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
>  drivers/gpu/drm/msm/msm_gem.h          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c  | 10 ----
>  drivers/gpu/drm/xe/xe_vm.c             |  4 +-
>  include/drm/drm_gpuvm.h                | 12 ++---
>  8 files changed, 76 insertions(+), 49 deletions(-)
> ---
> base-commit: 44e4c88951fa9c73bfbde8269e443ea5343dd2af
> change-id: 20251128-gpuvm-rust-b719cac27ad6
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
