Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369B8B3759E
	for <lists+freedreno@lfdr.de>; Wed, 27 Aug 2025 01:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B743010E6E1;
	Tue, 26 Aug 2025 23:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mZsNZHH2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA5C10E6DD
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 23:42:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKfaAk008052
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 23:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zu9C8ffYP2zbDrnUd2W1zM9YKo6YTVhAJreh0ub4tB4=; b=mZsNZHH2vrpoWbMB
 1dNmWkE7asnW6C8+z6PLbatFsJacAMKuO6/mbA6lSVJeDWLqXaI/MvJgRirXSk3X
 tbtKEEbEm3NKx6izBpLfJ00D+IGWGOOS59vVO36vBZd03P50O7SXq0hbb4yG6v37
 Mm+KTpTWDN3CglA3JLoQZqnK6JEui39E7bWxLEGpdGwAV3M7rbATg6w52GAI3bFL
 DAciHcH+izqmlrhP4ccllgnmaUjS4k5kxSik/Zs/3M3IuG4p5V4qTebZg7kOSgTJ
 AKsv9IQvcAuHrPR/CGHwQJCqq3vaMT53VfYVFGZr+k80BFN0NBmFGLyac7zvjE+G
 7XU0Hg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2tu99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 23:42:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bd3fa0so61024331cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 16:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756251757; x=1756856557;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zu9C8ffYP2zbDrnUd2W1zM9YKo6YTVhAJreh0ub4tB4=;
 b=auCWpmNW3DsNBxSC9VbzjdwoIQXUvyyK/FJwuILp7QEDKC4dk9RX0KtuDOgbz1rV/U
 0HlKIUij59DlXdxnIGxtnEj1NW7HJIb5wBhAOmCBF2IFBHw9UM+MLBkS2GOFMvb4ObtT
 duB0Z1HFjTvUIOYnJmKhO36VQPRZ9p+sfhYMfzNqGZKHB6pI7UoZ3CvJY6zLnmEG0fyr
 fGjmQsAYr+mmenfXdZ380QvJeBox2F8ztQ2EWUoEJl2MdC5sGQF+skS4aQdqQJSnSgJS
 Mvw6rcIGStMKYigz2PN1Ui504dFPwF3eag0r2zD7atwj2J5dJxSgODZRN2CDBxzK+ZwV
 jGNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoln6jqoPwwUc7PAOSE+c5JVXduFEYC+/Nrmfyn3LDv9WMuX3y+rHlSAhRc7FKF9bm2bVzvWbtRtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5vD76UTr4oDpSb6b3XNVbIpVtQ112Wf9V2cNMeSK5KqXAWEIR
 UfJVsBfk+XDUFqcEBg4w7ybyG8pduOurI3+hFa40jgriEkOcpiRjAw7gZi9nSzT9kUbXtG6P39u
 bYLAJ4w6kd2oviUG3FVUfKl/sN/MjL8YVZRizKG6R7eu4RkQDZGC+Xkpjo3xvsXv72Xwpq1I=
X-Gm-Gg: ASbGncuyW6TsI/2sf0HoPzt5FPXXi962nTytw1e5GMQyYUnq5AGTbDR2LJ9UbY+yzrJ
 SuQNCS8NW9PALESGLifSdW+XHXa+ahkTO+vvdorAqT0bXvPEcINV+YvjtSfWYsfhlZ6najPSopV
 RqWYFL83u62F6byqS5y6xC676IuEXO5Q+Q1JNKmoiwnQ1yirGTbd6c0TIKiXjgqAzSFtIhxHUGS
 zYnA1eSvFodopAM9OxDtCEv9psBl/e9G++nmDV6pmxab7r8qM3BdVEFY5dQUPSusI/h1aliCSca
 JpC6nFX6R1eYDWY7+RWxYPrQWKB+inMaS9ZGjcNsVdj1ZkZHb7cOBEKOjInxQvtQRLOCTenpoG2
 J9Sw4Wli1Ay+kju5OLK9Vo+H6T44l2ue32Ugcm8Ccb06TI5XOsDOW
X-Received: by 2002:a05:622a:1898:b0:4b2:f2b0:32fb with SMTP id
 d75a77b69052e-4b2f2b038cfmr1568041cf.1.1756251757076; 
 Tue, 26 Aug 2025 16:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjGIIylAidnuipVcsn/Q+ugXwaDOHP5jB2aqY956weD36FeNFEDeYWh8wFDm8rzuQrzEue6w==
X-Received: by 2002:a05:622a:1898:b0:4b2:f2b0:32fb with SMTP id
 d75a77b69052e-4b2f2b038cfmr1567761cf.1.1756251756549; 
 Tue, 26 Aug 2025 16:42:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3366de0ec70sm18587661fa.66.2025.08.26.16.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 16:42:34 -0700 (PDT)
Date: Wed, 27 Aug 2025 02:42:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 36/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to
 get the intf id
Message-ID: <exfflgjky4zgqa7tnudfteeosncr6nsuwqadxnfftxtjay6hke@fxru2weupuwt>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ae466e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FCQRL5G5Yy2VVt0fnmAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9RhkjD3i5E2E
 wV0OAyrpdd0xdP/q7+GJn9PfG2VJOSPWzToSdz4a6oRQzbmHQ/M8K/C6uPimWqTcFdNQlxkcSwy
 DWNMZyCKB4vXpJ3XYVj/jhRT7szBAPqhffNlJ1q5qwL8F1rU9R9G90Cv/nUjPdZbd/nzsYi6Xey
 XkVpHX3DzpawL9rqSlw1a8OWB96uUY0QeI/WJ4r2WoUbD7UBa4aLlqQKnsI5WF8wNQxNRGd0pNR
 biS3emr6ouoq6o/b/mwS1buY/80Mnc2dNb7l4TH9J52EsYLFCzESqocOdBHCJgtBZDpb3fGZf0j
 E6T87ZsDPSoQQN7yjts7wwwuek9/qcDBwX7HrFBAPP1j8vfepz6znf9nGAwn48/+gxHhamEYKBX
 FN9hkpYo
X-Proofpoint-GUID: 4ALvX-UrlZUsRvh8k-XAXZYKfz0QYzBT
X-Proofpoint-ORIG-GUID: 4ALvX-UrlZUsRvh8k-XAXZYKfz0QYzBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:16:22PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
> controller as the intf_id is unique for each MST stream of each
> DP controller.

I think we have one sensible exception: SC8180X, where we have several
DP controllers and one shared DP interface, but let's forget about it
for now...

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 51 +++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 05e5f3463e30c9a6bd5b740580720ae2bf6b3246..2eb5397d15732b224372c68d0b2b7167da9f2896 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1429,17 +1429,52 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>  
>  static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>  		struct dpu_rm *dpu_rm,
> -		enum dpu_intf_type type, u32 controller_id)
> +		enum dpu_intf_type type, int enc_type, u32 id)
>  {
> -	int i = 0;
> +	int i = 0, cnt = 0;
> +	int controller_id = id >> 16;
> +	int stream_id = id & 0x0F;
>  
>  	if (type == INTF_WB)
>  		return NULL;
>  
> -	for (i = 0; i < catalog->intf_count; i++) {
> -		if (catalog->intf[i].type == type
> -		    && catalog->intf[i].controller_id == controller_id) {
> -			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> +	if (enc_type == DRM_MODE_ENCODER_DPMST) {
> +		/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
> +		 * example:
> +		 * DPU_8_4_0 - DP Controller intf to stream Mapping
> +		 *
> +		 * +-------------+----------+----------+----------+----------+
> +		 * | stream_id   |    0     |    1     |    2     |    3     |
> +		 * +-------------+----------+----------+----------+----------+
> +		 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
> +		 * | DP1         | INTF_4   | INTF_8   |          |          |
> +		 * +-------------+----------+----------+----------+----------+
> +		 *
> +		 * DPU_9_2_0 - DP Controller intf to stream Mapping
> +		 *
> +		 * +-------------+----------+----------+
> +		 * | Controller  |    0     |    1     |
> +		 * +-------------+----------+----------+
> +		 * | DP0         | INTF_0   | INTF_3   |
> +		 * | DP1         | INTF_4   | INTF_8   |
> +		 * | DP2         | INTF_6   | INTF_7   |
> +		 * +-------------+----------+----------+
> +		 */
> +		DPU_DEBUG("controller_id %d for stream_id = %d\n", controller_id, stream_id);
> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == INTF_DP
> +			&& controller_id == catalog->intf[i].controller_id) {

&& should be on the previous line

> +				if (cnt == stream_id)

if (cnt++ == stream_id) return;

> +					return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> +				cnt++;
> +			}
> +		}

return NULL, drop else{}

> +	} else {
> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == type
> +			&& catalog->intf[i].controller_id == controller_id) {
> +				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> +			}
>  		}
>  	}
>  
> @@ -2670,7 +2705,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  
>  		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
>  							   disp_info->intf_type,
> -							   controller_id);
> +							   dpu_enc->base.encoder_type,
> +							   controller_id << 16
> +							   | disp_info->stream_id);

No need to, just pass whole disp_info pointer.

>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
