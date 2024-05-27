Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687938CF6E8
	for <lists+freedreno@lfdr.de>; Mon, 27 May 2024 02:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B0210E741;
	Mon, 27 May 2024 00:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PiWZpHOm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F059B10E741
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 00:03:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5E96760F33;
 Mon, 27 May 2024 00:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72ECC2BD10;
 Mon, 27 May 2024 00:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716768202;
 bh=Mz3OF3B15X3H0lFrcQA68DoS91Or2bDicgLrhyGKkHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PiWZpHOmjAl9W7sSk/AgizPxT4u6NWhZCOXL9upKTDepm+qKTvZ7eDCLfAixbOF6q
 IbsyX0FsJ0Pgibq2XOV1KDtBTfg3MCqKg9kSX76bFTI95JIavlYfmGbVdeq9u0pc/i
 7gTcLx3TogltDrGtDRXKAAsBe7QZYXRmAU4Wh0/95T1W6FMrz2o51i6AAWQ++KK/i+
 mHs21opCxjoBOUPK9MuRj8cYL3L1RUHDoQNyou0uz1/jPcgliZD6v+y0aY8gIQS+1f
 Bwd8zGM/VEkjL7sM3DUMNTvUZZ/YXv5DDzZf/54PPqHBodMIahLU4C/poid5uke4c9
 iJMTFOBG4YPDQ==
Date: Sun, 26 May 2024 19:03:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 2/6] firmware: qcom_scm: Add gpu_init_regs call
Message-ID: <5uvps3a2zn2q4eokzx5ptmylid4cqt6e6gaasv4qssblczaklv@yr3nfhswn7dt>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430-a750-raytracing-v3-2-7f57c5ac082d@gmail.com>
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

On Tue, Apr 30, 2024 at 11:43:16AM GMT, Connor Abbott wrote:
> This will used by drm/msm to initialize GPU registers that Qualcomm's
> firmware doesn't make writeable to the kernel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/firmware/qcom/qcom_scm.c       | 14 ++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |  3 +++
>  include/linux/firmware/qcom/qcom_scm.h | 23 +++++++++++++++++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 06e46267161b..f8623ad0987c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1394,6 +1394,20 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
>  
> +int qcom_scm_gpu_init_regs(u32 gpu_req)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_GPU,
> +		.cmd = QCOM_SCM_SVC_GPU_INIT_REGS,
> +		.arginfo = QCOM_SCM_ARGS(1),
> +		.args[0] = gpu_req,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +
> +	return qcom_scm_call(__scm->dev, &desc, NULL);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
> +
>  static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
>  {
>  	struct device_node *tcsr;
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index 4532907e8489..484e030bcac9 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -138,6 +138,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
>  
> +#define QCOM_SCM_SVC_GPU			0x28
> +#define QCOM_SCM_SVC_GPU_INIT_REGS		0x01
> +
>  /* common error codes */
>  #define QCOM_SCM_V2_EBUSY	-12
>  #define QCOM_SCM_ENOMEM		-5
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index aaa19f93ac43..a221a643dc12 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -115,6 +115,29 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
>  int qcom_scm_lmh_profile_change(u32 profile_id);
>  bool qcom_scm_lmh_dcvsh_available(void);
>  
> +/*
> + * Request TZ to program set of access controlled registers necessary
> + * irrespective of any features
> + */
> +#define QCOM_SCM_GPU_ALWAYS_EN_REQ BIT(0)
> +/*
> + * Request TZ to program BCL id to access controlled register when BCL is
> + * enabled
> + */
> +#define QCOM_SCM_GPU_BCL_EN_REQ BIT(1)
> +/*
> + * Request TZ to program set of access controlled register for CLX feature
> + * when enabled
> + */
> +#define QCOM_SCM_GPU_CLX_EN_REQ BIT(2)
> +/*
> + * Request TZ to program tsense ids to access controlled registers for reading
> + * gpu temperature sensors
> + */
> +#define QCOM_SCM_GPU_TSENSE_EN_REQ BIT(3)
> +
> +int qcom_scm_gpu_init_regs(u32 gpu_req);
> +
>  #ifdef CONFIG_QCOM_QSEECOM
>  
>  int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
> 
> -- 
> 2.31.1
> 
