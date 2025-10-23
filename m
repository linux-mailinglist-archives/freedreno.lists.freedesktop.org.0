Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3CC010B8
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 14:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7204510E3F7;
	Thu, 23 Oct 2025 12:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="icgvQ3yD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204E110E3F6
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N72JiT011684
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=4e4CsJ2qxbzcJTqFCSRdFwah
 q7xIbkuDSSw+M5pcQjk=; b=icgvQ3yDf93btZBjpIalqoLkmXnQ2pDi+Q1TVXRV
 539dPkpkFQMTkL4CilRdyArqe01KPg9kus6yPMaAgoU3BiOF1+UFPgTDUAj4PIIa
 b2278e6v35mn4pjjNchMDN5jUA73hHKhSxWMzox+hikwZ92oCwKbZLyXv8NccOX3
 Bmmpo7vFtSIHlmP7tNvqBMQpKJVH1EDTr+r7qU1Zgyfa9ug1a/81EAXYwm2lSLoL
 iAhIfY0qmYsMuS/e+9EXPHTOgLYRT0cFPKXIbFvMVGRHDOcpfhjBK9Jk/ZtlC4ti
 mbqEJbViiZq5MStIvSRkigVtkz4XqYINo3Lp+ijOhT46oQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524ahmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c146f81cdso18419236d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 05:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221794; x=1761826594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4e4CsJ2qxbzcJTqFCSRdFwahq7xIbkuDSSw+M5pcQjk=;
 b=trUMM5jW6dhokNa8R1n2pJIqNhUm5I6BxDwhH0uvqBOFcGaA293LWWfimNuDlXb1yo
 QMSJ8tfvON7krk3ZOwG73P7VfynnQyWQxQv4QAD7itii0WjXaVCE4hpvvm8TfAfkhjgi
 kFDoMosQC8S61Ps3QbID+tf7ZCVjYK2e2A+OLw8/m4o8QXdzPpWMNlqueutIrM82yHEh
 KNU1xP7gl6CJdFvb2mBn+t4iEsGtdYUpmUh5ed5jRpdKBTch8ZmOt6MOn7usra+KZwy6
 EvolCWP1kpS+OTQrqTSXyeIIEXQJbpwcJ61GJscNeA7aSRhlrV2EVj6AvT/FcUseCUP0
 5B3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe/U/qXToNgPw5JOcT2AUEGjFlwe7heTJHKS91aFRuTUW4bzb3HFofiOcqM4LgFHlCge8gddsFOrw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxffgXjiIdyh3pAjohZjF97TrqGZflYRsQDrP9zNOQhk6Vfaxy8
 nJIeuEcMMhO+JP8kMH9+a6ZmELjBToxsxHeMhkeNeZKEnq+bqzGIba3PJ05yyZ2mGbzCbAXvCbu
 32gc0eRzdzH83getI9HfCEHo7X8sXjXNsrPvx5GYrgt5PC3kwvfbjXMlrxZDrnu+Zx8KTQOw=
X-Gm-Gg: ASbGncu1MhSLpry0f5E9dwZCVHTlnAM8C5VILPBEmMkGPnN3JjwPFcE+zwebxXBFJ6q
 To/vLY4yIl04AeYJC7tFjHRBmgUONSSRH69jGZ3wiCxZICKmK+oHw8f+5+0Zy4Yxvot9RrrK7gM
 ZSECDbPkK5jwCuiIuN6j9oPnONXMm0ek/g2nkdEs0WypzSJ51PIUF4KEkP++71bUiB1KCUpHQC5
 hP6FZTFcOc4JSlVum622VgysjwGJ6oxdQ1UPfTgiGIDsRY8b/0hck26csYZvL05GUJ6FUBgRuQD
 eHrujYaVo3BH7FZsIU5OGH/ElY740luOLKbbHatgC06RvB5zV6TIE8ze5o51GpZaFNncRws2ver
 D+Lknv08ZwMmh42s81bnRmk3Rg8P8QhOSjj/Wu6XHsjbp422NiNdBEevpueLgXigCbb1VFlT+2W
 jiEwL3JKmG5kNL
X-Received: by 2002:ac8:5916:0:b0:4e8:a9ee:940d with SMTP id
 d75a77b69052e-4e8b6848072mr186108501cf.65.1761221794274; 
 Thu, 23 Oct 2025 05:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGop9hpBDFFP1MrcMk2Fsq2TpD6+/75ykSiER9cOjUVWtI35/vGRfvOgaBCSCvXp2xBdGKtQ==
X-Received: by 2002:ac8:5916:0:b0:4e8:a9ee:940d with SMTP id
 d75a77b69052e-4e8b6848072mr186107931cf.65.1761221793683; 
 Thu, 23 Oct 2025 05:16:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4d38709sm678359e87.106.2025.10.23.05.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:16:32 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:16:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX6Gct2k8R2+GV
 ToGiFN9Gm+EogOzVnAGn+9FujpSPMDM6973ANIGBcvA0IkZ7BkW/jtllS+hEVCEvLVvnA450oef
 3Q4bL7qkrdS9o7HjKfADXX3l4FRLr7gs/DsDM/6wLcidzB8IZ6a05/MqJVL6wptd+Ti8LQgqqvt
 1/e5gkHsvu7mVNL6rQUvodDcFKJClAm5O2/CkiN6rlcRKnsIXR6jO0f5NV9jR9hW1Q665PkMB5M
 J+8f9nYx8Y6wdABwJGHaYtC1JdZMrH0GMPZbr09vdp01dfV2pUCAPQiVt2S0dJvuzAgs6MHIhzg
 UHFNh7aWO90s25+nuJrmcqOciylZShYh6NFrCZ0FgjUdofrHzR8mqqBlm7PERD5f3Hvi1P4PC+p
 BPWoYze8Tnk/WIeZ/aaDrYpbO8NsiQ==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa1ca3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=hdgSSxsrCpB_R1hBYGgA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xQs5M3RmIyvJZf-XbUidTVoQ17ylrv0v
X-Proofpoint-ORIG-GUID: xQs5M3RmIyvJZf-XbUidTVoQ17ylrv0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
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

On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

In the subject: DSI, not DSi

> 
> Add DSI PHY for Kaanapali.

Why?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 1ca820a500b7..a6e044eed3df 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - qcom,dsi-phy-7nm
>        - qcom,dsi-phy-7nm-8150
> +      - qcom,kaanapali-dsi-phy-3nm
>        - qcom,sa8775p-dsi-phy-5nm
>        - qcom,sar2130p-dsi-phy-5nm
>        - qcom,sc7280-dsi-phy-7nm
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
